require "stripe"
Rails.configuration.stripe = {
  :publishable_key => "",
  # :secret_key      => "sk_test_sN2aKAVijawg4PbLfDh7br9Y"
}

#Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Stripe.api_key = "sk_test_sN2aKAVijawg4PbLfDh7br9Y"

if(Rails.env == 'development' || Rails.env == 'staging')
  Stripe.api_key = ENV['STRIPE_TEST_SECRET']  
  Rails.configuration.stripe[:publishable_key] = ENV['STRIPE_TEST_PUBLIC']
elsif(Rails.env == 'production')
  Stripe.api_key = ENV['STRIPE_LIVE_SECRET']  
  Rails.configuration.stripe[:publishable_key] = ENV['STRIPE_LIVE_PUBLIC']
end