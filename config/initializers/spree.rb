# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

Spree.config do |config|
  # Without this preferences are loaded and persisted to the database. This
  # changes them to be stored in memory.
  # This will be the default in a future version.
  # This line resets all preferences! It should be the first line in the block
  config.use_static_preferences!

  # Core:

  # Default currency for new sites
  config.currency = "USD"

  # from address for transactional emails
  config.mails_from = "store@example.com"

  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When set, product caches are only invalidated when they fall below or rise
  # above the inventory_cache_threshold that is set. Default is to invalidate cache on
  # any inventory changes.
  # config.inventory_cache_threshold = 3


  # Frontend:

  # Custom logo for the frontend
  # config.logo = "logo/solidus_logo.png"

  # Template to use when rendering layout
  # config.layout = "spree/layouts/spree_application"


  # Admin:

  # Custom logo for the admin
  # config.admin_interface_logo = "logo/solidus_logo.png"

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  # config.static_model_preferences.add(
  #   Spree::Gateway::StripeGateway,
  #   'stripe_env_credentials',
  #   secret_key: ENV['STRIPE_SECRET_KEY'],
  #   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  #   server: Rails.env.production? ? 'production' : 'test',
  #   test_mode: !Rails.env.production?
  # )

  # ShipStation Configuration
  #
  # choose between Grams, Ounces or Pounds
  config.shipstation_weight_units = "Grams"

  # ShipStation expects the endpoint to be protected by HTTP Basic Auth. Set the
  # username and password you desire for ShipStation to use. You should also place these
  # values in to your `secrets.yml` file to make they configurable between stage/production
  # environments for testing purposes.
  config.shipstation_username = "smoking_jay_cutler"
  config.shipstation_password = "my-awesome-password"

  # Turn on/off SSL requirepments for testing and development purposes
  config.shipstation_ssl_encrypted = !Rails.env.development?

  # Captures payment when ShipStation notifies a shipping label creation, defaults to false
  config.shipstation_capture_at_notification = false

  # Spree::Core related configuration
  # Both of these Spree::Core configuration options will affect which shipment records
  # are pulled by ShipStation
  config.require_payment_to_ship = true # false if not using auto_capture for payment gateways, defaults to true
  config.track_inventory_levels = true # false if not using inventory tracking features, defaults to true

end

Spree::Frontend::Config.configure do |config|
  config.use_static_preferences!

  config.locale = 'en'
end

Spree::Backend::Config.configure do |config|
  config.use_static_preferences!

  config.locale = 'en'
end

Spree::Api::Config.configure do |config|
  config.use_static_preferences!

  config.requires_authentication = true
end

Spree.user_class = "Spree::LegacyUser"
