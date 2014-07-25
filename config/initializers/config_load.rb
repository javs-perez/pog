APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

Rails.configuration.stripe = {
	:publishable_key => ENV['PUBLISHABLE_KEY'],
	:secret_key			 => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, APP_CONFIG[Rails.env]["google_api_id"], APP_CONFIG[Rails.env]["google_api_key"]
    {
      :name => "google",
      :scope => "userinfo.email, userinfo.profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50,
      :approval_prompt => ''
    }
end
