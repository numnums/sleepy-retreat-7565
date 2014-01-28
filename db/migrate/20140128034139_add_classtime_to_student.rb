class AddClasstimeToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomtime, :string
  end
end
