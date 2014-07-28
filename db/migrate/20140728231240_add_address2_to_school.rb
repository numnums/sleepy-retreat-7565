class AddAddress2ToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :address2, :string
  end
end
