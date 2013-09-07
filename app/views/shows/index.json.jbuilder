json.array!(@shows) do |show|
  json.extract! show, 
  json.url show_url(show, format: :json)
end
