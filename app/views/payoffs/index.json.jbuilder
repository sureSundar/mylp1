json.array!(@payoffs) do |payoff|
  json.extract! payoff, :id, :name, :url, :payoff, :project_id
  json.url payoff_url(payoff, format: :json)
end
