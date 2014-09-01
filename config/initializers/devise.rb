Devise.setup do |config|
  config.mailer_sender = 'no-reply@photo-viewer.com'
  config.omniauth :google_oauth2, ENV["google_client_id"], ENV["google_client_secret"], { access_type: "offline", approval_prompt: "", scope: "userinfo.email, https://picasaweb.google.com/data/" }
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end