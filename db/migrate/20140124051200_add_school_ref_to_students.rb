class AddSchoolRefToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :school, index: true
  end
end
