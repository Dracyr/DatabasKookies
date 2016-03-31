json.array!(@pallets) do |pallet|
  json.extract! pallet, :id, :status, :product_id, :order_id
  json.url pallet_url(pallet, format: :json)
end
