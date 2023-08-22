# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://grow-curriculum-backend-f10ce9239245.herokuapp.com' # Vue.js アプリケーションの Netlify ドメイン
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
