# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Grifter::Application.initialize!


ActionMailer::Base.smtp_settings = {
	:user_name => 'fundyapp@gmail.com',
	:password => ENV['GMAIL_PASSWORD'],
	:domain => 'gmail.com',
	:address => 'smtp.gmail.com',
	:port => 587,
	:enable_starttls_auto => true
}
