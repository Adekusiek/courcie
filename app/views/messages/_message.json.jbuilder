json.extract! message, :id, :content, :user_to_id, :user_from_id, :created_at, :updated_at
json.url message_url(message, format: :json)
