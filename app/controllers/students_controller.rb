class StudentsController < ApplicationController
	
  def index
    @students = Student.all
  end

	def new
	end

  #shows edit form
  def edit
    @student = Student.find(params[:id])
  end

  #processes update
  def update
    @student = Student.find(params[:id])
   
    if @student.update(params[:student].permit(:firstname, :lastname, :gender))
      redirect_to @student
    else
      render 'edit'
    end
  end

	def create
  		@student = Student.new(student_params)
  		@student.save
  		redirect_to @student
  end

  def show
  		@student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
   
    redirect_to students_path
  end

  private
	def student_params
			params.require(:student).permit(:firstname, :lastname, :gender)
	end

end
