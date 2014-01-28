class ChargesController < ApplicationController

	# def new
	# 	if session[:new_parent_id]
	# 		@new_parent = Parent.find(session[:new_parent_id])
	# 	end	
	# 	if session[:new_student_id]
	# 		@new_student = Student.find(session[:new_student_id])
	# 	end
	# end

	def registerparent

	end

	def registerstudent
		@schools = School.all
      	@parents = Parent.all
      	@student = Student.new
      	if session[:new_parent_id]
        	@parent = Parent.find(session[:new_parent_id])
      	end 
		
	end

	# def payment
	# end

	# <%= form_tag charges_path do %> in new.html.erb routes to the Charges controller.  Because it's a form, the default
	# method is a POST, which maps to the 'create' method.  If you run 'rake routes' you can see this automatic mapping.
	# def create
	# 	# Amount in cents ($20.00)
	#   	@amount = 2000

	# 	customer = Stripe::Customer.create(
	# 		:email => 'example@stripe.com',
	# 		:card  => params[:stripeToken]
	# 	)

	# 	charge = Stripe::Charge.create(
	# 		:customer    => customer.id,
	# 		:amount      => @amount,
	# 		:description => 'Rails Stripe customer',
	# 		:currency    => 'usd'
	# 	)

	# 	rescue Stripe::CardError => e
	#   		flash[:error] = e.message
	# 	  	redirect_to charges_path
	# end

end
