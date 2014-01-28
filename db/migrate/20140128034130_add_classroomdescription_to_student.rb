class AddClassroomdescriptionToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomdescription, :string
  end
end
