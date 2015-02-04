class AddEmployeeRefToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :employee, index: true
  end
end
