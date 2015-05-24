json.array!(@tags) do |tag|
  json.extract! tag, :id, :title, :tag_name, :description
end
