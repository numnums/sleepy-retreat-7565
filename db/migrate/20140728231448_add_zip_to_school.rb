class AddZipToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :zip, :string
  end
end
