json.array!(@people) do |person|
  json.extract! person, :id, :name, :number, :last_call, :last_attempt
  json.url person_url(person, format: :json)
end
