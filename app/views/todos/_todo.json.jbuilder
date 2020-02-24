json.extract! todo, :id, :title, :description, :type, :developer_id, :creator_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
