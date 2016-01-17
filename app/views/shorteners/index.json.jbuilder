json.array!(@shorteners) do |shortener|
  json.extract! shortener, :id, :url, :slug
  json.url shortener_url(shortener, format: :json)
end
