class AddStateToParent < ActiveRecord::Migration
  def change
    add_column :parents, :state, :string
  end
end
