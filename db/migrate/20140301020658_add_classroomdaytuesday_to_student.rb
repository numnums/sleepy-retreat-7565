class AddClassroomdaytuesdayToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classroomdaytuesday, :string
  end
end
