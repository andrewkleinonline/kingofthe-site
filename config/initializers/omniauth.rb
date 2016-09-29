Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_LOCAL_APP_ID'], ENV['FACEBOOK_LOCAL_SECRET'],
  scope: 'public_profile,email', display: 'touch',
  info_fields: 'first_name,last_name,email',
  image_size: 'large',
  secure_image_url: true
end
