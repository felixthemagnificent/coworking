json.array!(@meals) do |meal|
  json.extract! meal, :id, :name, :price, :is_available
  json.url meal_url(meal, format: :json)
end
