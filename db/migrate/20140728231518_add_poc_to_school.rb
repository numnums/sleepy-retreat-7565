class AddPocToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :POC, :string
  end
end
