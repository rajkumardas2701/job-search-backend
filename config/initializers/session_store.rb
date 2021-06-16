# if Rails.env == 'production' 
  Rails.application.config.session_store :cookie_store, key: '_job-search-backend', domain: 'jobhub2701-backend.herokuapp.com'
# else
  # Rails.application.config.session_store :cookie_store, key: '_job-search-backend'
# end