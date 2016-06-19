json.array!(@orders) do |order|
  json.extract! order, :id, :visit_id
  json.url order_url(order, format: :json)
end
