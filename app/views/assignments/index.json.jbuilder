json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :user_id, :customer_id, :tab_id
  json.url assignment_url(assignment, format: :json)
end
