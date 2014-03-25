class AddPaymentRefToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :payment, index: true
  end
end
