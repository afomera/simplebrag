json.extract! accomplishment, :id, :name, :description, :completed_at, :user_id, :created_at, :updated_at
json.url accomplishment_url(accomplishment, format: :json)
json.description accomplishment.description.to_s
