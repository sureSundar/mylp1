json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :user, :logo, :hpuser_id
  json.url project_url(project, format: :json)
end
