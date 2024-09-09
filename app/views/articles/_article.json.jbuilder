json.extract! article, :id, :admin_id, :title, :body, :status, :created_at, :updated_at
json.url article_url(article, format: :json)
