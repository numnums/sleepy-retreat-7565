class RemoveClassroomdayFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :classroomday, :string
  end
end
