json.array!(@production_blocks) do |production_block|
  json.extract! production_block, :id, :product_id, :start_at, :end_at
  json.url production_block_url(production_block, format: :json)
end
