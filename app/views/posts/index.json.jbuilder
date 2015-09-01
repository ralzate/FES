json.array!(@posts) do |post|
  json.extract! post, :id, :nombre
  json.url post_url(post, format: :json)
end
