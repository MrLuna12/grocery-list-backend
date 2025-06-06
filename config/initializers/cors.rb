Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # In production, replace with your React Native app's domain
    resource '*',
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      expose: [ 'Authorization' ]
  end
end
