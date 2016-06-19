json.array!(@memberships) do |membership|
  json.extract! membership, :id, :name, :description
  json.url membership_url(membership, format: :json)
end
