json.array!(@tournaments) do |tournament|
  json.extract! tournament, :name, :description, :latitude, :longitude, :address
  json.url tournament_url(tournament, format: :json)
end