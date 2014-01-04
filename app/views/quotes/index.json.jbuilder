json.array!(@quotes) do |quote|
  json.extract! quote, :id, :author, :quote, :image_url
  json.url quote_url(quote, format: :json)
end
