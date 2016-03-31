json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :delivered_at
  json.url order_url(order, format: :json)
end
