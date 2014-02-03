#dvu: can probably be renamed to RegistrationFlowController, but I'm expecting this to change in the next phase
#when we add user registration/login anyway.

class ChargesController < ApplicationController

	def registerparent
		@parent = Parent.new
		@parent.acceptsmarketing = true
	end

	def registerstudent
		@schools = School.all
      	@parents = Parent.all
      	@student = Student.new
      	if session[:new_parent_id]
        	@parent = Parent.find(session[:new_parent_id])
      	end 
		
	end


end
