class AddTitleToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :title, :string
  end
end
