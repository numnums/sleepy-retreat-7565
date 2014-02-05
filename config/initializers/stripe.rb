require "stripe"
Rails.configuration.stripe = {
  :publishable_key => "pk_test_QwZn8MgHhFeWmGEzqV2yIjYF",
  # :secret_key      => "sk_test_sN2aKAVijawg4PbLfDh7br9Y"
}

#Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Stripe.api_key = "sk_test_sN2aKAVijawg4PbLfDh7br9Y"

if(Rails.env == 'development' || Rails.env == 'staging')
  Stripe.api_key = "sk_test_mfiW5pBwJFSj9ohtkKKLG0u9"  
elsif(Rails.env == 'production')
  Stripe.api_key = "sk_test_mfiW5pBwJFSj9ohtkKKLG0u9"  
end