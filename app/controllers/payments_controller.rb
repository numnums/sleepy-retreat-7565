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
		if session[:buy_one_get_one] == "yes"
			@amount = 4000	
		else
	  		@amount = 2000
	  	end	

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @amount,
			:description => 'Vision Screening',
			:currency    => 'usd'
		)

		@payment = Payment.new
		@payment.student = @student
		@payment.parent = @parent
		@payment.save

		@student = Student.find(session[:new_student_id])
		@student.payment = @payment
		@student.save

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
