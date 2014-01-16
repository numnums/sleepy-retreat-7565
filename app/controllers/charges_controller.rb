class ChargesController < ApplicationController

	def new
	end

	# <%= form_tag charges_path do %> in new.html.erb routes to the Charges controller.  Because it's a form, the default
	# method is a POST, which maps to the 'create' method.  If you run 'rake routes' you can see this automatic mapping.
	def create
		# Amount in cents ($5.00)
	  	@amount = 500

		customer = Stripe::Customer.create(
			:email => 'example@stripe.com',
			:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @amount,
			:description => 'Rails Stripe customer',
			:currency    => 'usd'
		)

		rescue Stripe::CardError => e
	  		flash[:error] = e.message
		  	redirect_to charges_path
	end

end
