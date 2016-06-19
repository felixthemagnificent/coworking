json.array!(@visits) do |visit|
  json.extract! visit, :id, :customer_id, :membership, :check_in, :check_out
  json.url visit_url(visit, format: :json)
end
