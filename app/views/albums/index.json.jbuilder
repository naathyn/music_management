json.array!(@albums) do |album|
  json.extract! album, 
  json.url album_url(album, format: :json)
end
