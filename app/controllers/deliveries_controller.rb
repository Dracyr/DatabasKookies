class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
  end

  def new
    @delivery = Delivery.new
  end

  def create

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def delivery_params
    params.require(:delivery).permit()
  end
end
