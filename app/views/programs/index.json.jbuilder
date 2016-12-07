json.array!(@programs) do |program|
  json.extract! program, :id, :title, :short_description, :long_description, :deadline, :tags
  json.url program_url(program, format: :json)
end
