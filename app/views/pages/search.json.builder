json.array!(@tournaments) do |tournament|
  json.extract! tournament, :latitude, :longitude
  json.url tournament_url(tournament, format: :json)
end