class StudentsController < ApplicationController
	
  def index
    @students = Student.all
  end

	def new
      @schools = School.all
      @student = Student.new
      render layout: false
	end

  #shows edit form
  def edit
    @student = Student.find(params[:id])
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
      render layout: false
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
   
    redirect_to students_path
  end

  private
	def student_params
			params.require(:student).permit(:firstname, :lastname, :gender, :school_id)
	end

end
