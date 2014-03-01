class AddClassroomdaymondayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomdaymonday, :string
  end
end
