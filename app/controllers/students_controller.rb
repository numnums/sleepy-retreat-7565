class StudentsController < ApplicationController
	
  before_filter :authenticate, :except => [:new, :create]

  def index
    @students = Student.all
  end

	def new
      @schools = School.all
      @parents = Parent.all
      @student = Student.new
      if session[:new_parent_id]
        @parent = Parent.find(session[:new_parent_id])
      end 

      render layout: false
	end

  #shows edit form
  def edit
    @student = Student.find(params[:id])
   @schools = School.all
   @parents = Parent.all

  end

  #processes update
  def update
    @student = Student.find(params[:id])
   
    if @student.update(params[:student].permit(:firstname, :lastname, :gender, :school_id, :parent_id, :wearsglasses))
      redirect_to :action => 'index'
    else
      render 'edit'
    end
  end

	def create
      @school = School.find(student_params[:school_id])
      @student =  @school.students.create(student_params)
      # @parent = Parent.find(student_params[:parent_id])
      if @student.save        
           if session[:admin] 
              redirect_to :action => 'index'
           else
              session[:new_student_id] = @student.id;
              redirect_to new_payment_path
          end     
      else
        # a little buggy because of the modal window...
        redirect_to :action => 'new' 
      end
  		# redirect_to :action => 'index'
  end

  def show
  		@student = Student.find(params[:id])
      @school = @student.school
      # @parent = @student.parent
      render layout: false
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
   
    redirect_to students_path
  end

  private
	def student_params
			params.require(:student).permit(:firstname, :lastname, :gender, :school_id, :parent_id, :wearsglasses)
	end

  #dvu: redundant code, cut and pasted from schools controller
  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      session[:admin] = (user_name == "PBAdmin" && password == "preventblindness!!")
    end
  end


end
