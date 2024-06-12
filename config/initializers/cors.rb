Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://grow-curriculum.com', 'capacitor://localhost', 'http://localhost:3000'
    
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      expose: ['access-token', 'client', 'uid']
  end
end