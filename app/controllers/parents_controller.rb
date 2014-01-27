class ParentsController < ApplicationController

		# http_basic_authenticate_with :name => "PBAdmin", :password => "preventblindness!!" 
	before_filter :authenticate

	# loaded from modal, so don't use layout
	def new	  
  		render layout: false
	end

	def create
		@parent = Parent.new(parent_params)
		@parent.save
		redirect_to :action => 'index'
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
	 
	  if @parent.update(params[:parent].permit(:firstname, :lastname, :email))
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
		params.require(:parent).permit(:firstname,:lastname,:email)		
	end		

	private
	def authenticate
	  authenticate_or_request_with_http_basic do |user_name, password|
	    session[:admin] = (user_name == "PBAdmin" && password == "preventblindness!!")
	  end
	end

end
