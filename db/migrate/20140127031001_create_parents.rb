class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.references :student, index: true

      t.timestamps
    end
  end
end
