class AddZipToParent < ActiveRecord::Migration
  def change
    add_column :parents, :zip, :string
  end
end
