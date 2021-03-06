json.array!(@users) do |user|
  json.extract! user, :id, :name, :address, :employee_uid, :password_digest, :admin, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :role_name, :tab_id, :username, :logout_at
  json.url user_url(user, format: :json)
end
