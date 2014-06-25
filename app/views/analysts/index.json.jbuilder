json.array!(@analysts) do |analyst|
  json.extract! analyst, :name, :email, :analyst
  json.url analyst_url(analyst, format: :json)
end