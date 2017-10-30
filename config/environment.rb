ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :user_name => "username",
   :password => "pass"
 }

ActionMailer::Base.perform_deliveries = true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
