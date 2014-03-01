class AddClassroomdayfridayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomdayfriday, :string
  end
end
