json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :comment, :score
  json.url feedback_url(feedback, format: :json)
end
