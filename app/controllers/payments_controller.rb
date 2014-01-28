class PaymentsController < ApplicationController

	before_filter :authenticate, :except => [:new, :create]

	def index
	  @payments = Payment.all
	end

	def new
		@student = Student.find(session[:new_student_id])
		@parent = Parent.find(session[:new_parent_id])
	end

	def create

		@student = Student.find(session[:new_student_id])
		@parent = Parent.find(session[:new_parent_id])

		# Amount in cents ($20.00)
	  	@amount = 2000

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

		@payment = Payment.new
		@payment.student = @student
		@payment.parent = @parent
		@payment.save

		rescue Stripe::CardError => e
	  		flash[:error] = e.message
		  	redirect_to charges_path
	end

	private
	def authenticate
	  authenticate_or_request_with_http_basic do |user_name, password|
	    session[:admin] = (user_name == "PBAdmin" && password == "preventblindness!!")
	  end
	end

end
