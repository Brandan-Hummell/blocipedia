require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Checkpoint 3 marker
Bundler.require(*Rails.groups)

module Blocipedia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    ActionMailer::Base.smtp_settings = {
      user_name:      ENV['SENDMAIL_USERNAME'],
      password:       ENV['SENDMAIL_PASSWORD'],
      domain:         ENV['MAIL_HOST'],
      address:       'smtp.gmail.com',
      port:          '587',
      authentication: :plain,
      enable_starttls_auto: true
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
