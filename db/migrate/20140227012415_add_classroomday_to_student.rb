class AddClassroomdayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomday, :string
  end
end
