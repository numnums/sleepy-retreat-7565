class SchoolsController < ApplicationController

	# http_basic_authenticate_with :name => "PBAdmin", :password => "preventblindness!!" 
	before_filter :authenticate

	# loaded from modal, so don't use layout
	def new	  
  		render layout: false
	end

	def create
		@school = School.new(school_params)
		@school.save
		redirect_to :action => 'index'
	end

	def index	  
	  @schools = School.order("lower(name)")
	end

	def show
		@school = School.find(params[:id])
		render layout: false
	end

	def edit
	  @school = School.find(params[:id])
	end

	def update
	  @school = School.find(params[:id])
	 
	  if @school.update(params[:school].permit(:name,:description,:address,:address2,:city,:state,:zip,:POC,:title,:email,:phone))
	    redirect_to :action => 'index'
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @school = School.find(params[:id])
	  @school.destroy
	 
	  redirect_to schools_path
	end

	private 
	def school_params
		params.require(:school).permit(:name,:description,:address,:address2,:city,:state,:zip,:POC,:title,:email,:phone)		
	end		

	private
	def authenticate
	  authenticate_or_request_with_http_basic do |user_name, password|
	    session[:admin] = (user_name == "PBAdmin" && password == "preventblindness!!")
	  end
	end

end
