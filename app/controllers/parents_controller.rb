class ParentsController < ApplicationController

		# http_basic_authenticate_with :name => "PBAdmin", :password => "preventblindness!!" 
	before_filter :authenticate, :except => [:new, :create]

	# loaded from modal, so don't use layout
	def new
		render layout: false
	end

	def create
		@parent = Parent.new(parent_params)
		@parent.save
		session[:new_parent_id] = @parent.id
		if session[:admin] 
			redirect_to :action => 'index'
		else
			@student = Student.find(session[:new_student_id])
			@student.parent = @parent
			@student.save
  			redirect_to new_payment_path
  		end			
	end

	def index
	  @parents = Parent.all
	  
	end

	def show
		@parent = Parent.find(params[:id])
		render layout: false
	end

	def edit
	  @parent = Parent.find(params[:id])
	end

	def update
	  @parent = Parent.find(params[:id])
	 
	  if @parent.update(params[:parent].permit(:firstname, :lastname, :email, :acceptsmarketing, :address, :city, :state, :zip, :phone))
	    redirect_to :action => 'index'
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @parent = Parent.find(params[:id])
	  @parent.destroy
	 
	  redirect_to parents_path
	end

	private 
	def parent_params
		params.require(:parent).permit(:firstname,:lastname,:email, :acceptsmarketing, :address, :city, :state, :zip, :phone)		
	end		

	private
	def authenticate
	  authenticate_or_request_with_http_basic do |user_name, password|
	    session[:admin] = (user_name == "PBAdmin" && password == "preventblindness!!")
	  end
	end

end
