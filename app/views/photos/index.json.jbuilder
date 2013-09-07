json.array!(@photos) do |photo|
  json.extract! photo, 
  json.url photo_url(photo, format: :json)
end
