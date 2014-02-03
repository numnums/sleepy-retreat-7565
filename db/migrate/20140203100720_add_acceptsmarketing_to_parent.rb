class AddAcceptsmarketingToParent < ActiveRecord::Migration
  def change
    add_column :parents, :acceptsmarketing, :boolean
  end
end
