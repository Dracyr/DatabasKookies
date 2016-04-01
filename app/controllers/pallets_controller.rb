class PalletsController < ApplicationController
  before_action :set_search_params, only: :index
  before_action :transform_params, only: :index

  # GET /pallets
  # GET /pallets.json
  def index
    @pallets = Pallet.filter(params.slice(:blocked, :product_id, :created_at)).order(created_at: :desc)
  end

  # GET /pallets/new
  def new
    @pallet = Pallet.new
  end

  # POST /pallets
  # POST /pallets.json
  def create
    @pallet = Pallet.new(pallet_params)

    respond_to do |format|
      if @pallet.produce
        format.html { redirect_to pallets_path, notice: 'Pallet was successfully created.' }
        format.json { render :show, status: :created, location: pallets_path }
      else
        format.html { render :new }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def pallet_params
    params.require(:pallet).permit(:status, :product_id, :order_id)
  end

  def set_search_params
    @search = params.slice(:blocked, :product_id, :created_at)
  end

  def transform_params
    params[:created_at] = params[:created_at].split('~').map(&:to_date) if params[:created_at]
    params[:blocked] = params[:blocked] == "1" ? true : nil if params[:blocked]
    params[:product_id] = nil if params[:product_id] && params[:product_id].all?(&:blank?)
  end
end
