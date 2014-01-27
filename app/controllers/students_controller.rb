class StudentsController < ApplicationController
	
  before_filter :authenticate, :except => [:new]

  def index
    @students = Student.all
  end

	def new
      @schools = School.all
      @parents = Parent.all
      @student = Student.new
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
   
    if @student.update(params[:student].permit(:firstname, :lastname, :gender))
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
        redirect_to :action => 'index'
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
			params.require(:student).permit(:firstname, :lastname, :gender, :school_id, :parent_id)
	end

  #dvu: redundant code, cut and pasted from schools controller
  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      session[:admin] = (user_name == "PBAdmin" && password == "preventblindness!!")
    end
  end


end
