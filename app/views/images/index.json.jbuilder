json.array!(@images) do |image|
  json.extract! image, :id, :name, :original, :final, :height, :width, :project_id
  json.url image_url(image, format: :json)
end
