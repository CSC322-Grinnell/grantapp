json.array!(@apps) do |application|
  json.extract! application, :id, :user_id, :program_id
  json.url application_url(application, format: :json)
end
