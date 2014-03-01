class AddClassroomdaythursdayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomdaythursday, :string
  end
end
