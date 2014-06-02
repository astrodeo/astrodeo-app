json.array!(@obersvations) do |obersvation|
  json.extract! obersvation, :id
  json.url obersvation_url(obersvation, format: :json)
end
