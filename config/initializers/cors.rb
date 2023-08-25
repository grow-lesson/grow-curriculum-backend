Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://grow-official.netlify.app'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
      expose: ['access-token', 'client', 'uid'] # エクスポートするカスタムヘッダーを指定
  end
end

