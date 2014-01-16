require "stripe"
Rails.configuration.stripe = {
  :publishable_key => "pk_test_zqitE9RCVQUDRcHPpXfv9axF",
  :secret_key      => "sk_test_sN2aKAVijawg4PbLfDh7br9Y"
}

#Stripe.api_key = Rails.configuration.stripe[:secret_key]
Stripe.api_key = "sk_test_sN2aKAVijawg4PbLfDh7br9Y"