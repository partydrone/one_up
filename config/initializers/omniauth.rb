Rails.application.config.middleware.use OmniAuth::Builder do
  ##
  # Discord
  provider :discord,
    Rails.application.secrets.discord_client_id,
    Rails.application.secrets.discord_client_secret

  ##
  # Facebook
  provider :facebook,
    Rails.application.secrets.facebook_app_id,
    Rails.application.secrets.facebook_app_secret,
    scope: 'email'

  ##
  # Google
  provider :google_oauth2,
    Rails.application.secrets.google_client_id,
    Rails.application.secrets.google_client_secret,
    { name: 'google' }
end
