class AddClassroomdaywednesdayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomdaywednesday, :string
  end
end
