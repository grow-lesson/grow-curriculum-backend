DeviseTokenAuth.setup do |config|
  # tokenがリクエストごとに変わらないように修正
  config.change_headers_on_each_request = false 
  # トークンの有効期限を2日に設定
  config.token_lifespan = 2.days
end