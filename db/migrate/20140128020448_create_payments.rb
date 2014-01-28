class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end
end
