class AddPhoneToParent < ActiveRecord::Migration
  def change
    add_column :parents, :phone, :string
  end
end
