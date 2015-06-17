json.array!(@testmigs) do |testmig|
  json.extract! testmig, :id, :name, :email
  json.url testmig_url(testmig, format: :json)
end
