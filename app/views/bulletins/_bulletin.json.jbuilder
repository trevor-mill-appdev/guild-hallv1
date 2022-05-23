json.extract! bulletin, :id, :guild_id, :author_id, :body, :priority, :created_at, :updated_at
json.url bulletin_url(bulletin, format: :json)
