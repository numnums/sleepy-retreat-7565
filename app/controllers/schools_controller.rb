class SchoolsController < ApplicationController

	http_basic_authenticate_with :name => "PBAdmin", :password => "preventblindness!!" 

	def new
	end

	def create
		@school = School.new(school_params)
		@school.save
		redirect_to @school
	end

	def show
		@school = School.find(params[:id])
	end

	private 
		def school_params
			params.require(:school).permit(:name,:description)		
		end		

end
