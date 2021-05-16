if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_job-search-backend', domain: 'job-search-backend-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_job-search-backend'
end