# if Rails.env == 'production' 
  Rails.application.config.session_store :cookie_store, { 
    :key => '_job-search-backend',
    :domain => :all,
    :same_site => :none,
    :secure => :true,
    :tld_length => 2
  }
  
  # key: '_job-search-backend', domain: :all
# else
  # Rails.application.config.session_store :cookie_store, key: '_job-search-backend'
# end