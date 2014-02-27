class AddCityToParent < ActiveRecord::Migration
  def change
    add_column :parents, :city, :string
  end
end
