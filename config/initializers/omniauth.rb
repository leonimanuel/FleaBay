Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

# Rails.application.config.middleware.use
# OmniAuth::Builder do
# 	# provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE-SECRET"]
# 	provider :facebook, ENV[:FACEBOOK_KEY], ENV[:FACEBOOK_SECRET]
# end