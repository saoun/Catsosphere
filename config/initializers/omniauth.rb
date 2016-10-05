Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID_THX"], ENV["GOOGLE_CLIENT_SECRET_THX"],
  #   {
  #     :name => "google",
  #     :scope => "email, profile",
  #     :prompt => "select_account",
  #     :image_aspect_ratio => "square",
  #     :image_size => 50
  #   }

  provider :twitter, ENV["TWITTER_CLIENT_ID"], ENV['TWITTER_CLIENT_SECRET']

  # provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]
end
