json.array!(@discoveries) do |discovery|
  json.extract! discovery, 
  json.url discovery_url(discovery, format: :json)
end
