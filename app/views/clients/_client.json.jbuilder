json.extract! client, :id, :name, :email, :due_day, :payment_method_key, :created_at, :updated_at
json.url client_url(client, format: :json)
