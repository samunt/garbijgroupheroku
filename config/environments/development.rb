Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.'

  # Action Mailer configuration
  #These settings are for the sending out email for active admin and consequently the   devise mailer
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.perform_deliveries = true
  # ActionMailer::Base.raise_delivery_errors = true
  # ActionMailer::Base.smtp_settings =
  # {
  #
  #   :address            => 'smtp.gmail.com',
  #   :port               => 587,
  #   :domain             => 'gmail.com', #you can also use google.com
  #   :authentication     => :plain,
  #   :user_name          => @user.email,
  #   :password           => @user.password
  # }

  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Setup ActiveMerchant
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test

     paypal_options = {
      :login => "garbagebitmaker-facilitator_api1.gmail.com",
      :password => "7VFT7CJSYDR75SYE",
      :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AlBPsr46eZaQjuTqIS7fRb7YZ0GB"
    }
    ::EXPRESS_GATEWAY = ActiveMerchant::Billing::StripeGateway.new(:login => 'sk_test_PewmULzxhxbepHBu1nQw6l6D')

    #  = ActiveMerchant::Billing::StripeExpressGateway.new(paypal_options)
  end

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
