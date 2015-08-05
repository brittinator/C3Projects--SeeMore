module OmniAuth
  module Strategies
    autoload :Developer, Rails.root.join('lib', 'strategies', 'omni_auth')
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :Developer, "http://localhost:3000/login"
  provider :developer
end
