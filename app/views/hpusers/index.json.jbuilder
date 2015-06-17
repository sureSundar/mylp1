json.array!(@hpusers) do |hpuser|
  json.extract! hpuser, :id, :username, :password, :email, :client_id, :client_secret
  json.url hpuser_url(hpuser, format: :json)
end
