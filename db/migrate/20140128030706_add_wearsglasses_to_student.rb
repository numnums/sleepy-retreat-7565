class AddWearsglassesToStudent < ActiveRecord::Migration
  def change
    add_column :students, :wearsglasses, :string
  end
end
