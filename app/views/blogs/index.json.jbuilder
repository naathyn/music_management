json.array!(@blogs) do |blog|
  json.extract! blog, 
  json.url blog_url(blog, format: :json)
end
