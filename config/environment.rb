# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.config.gem "activemerchant", :lib => "active_merchant", :version => "1.4.1"
