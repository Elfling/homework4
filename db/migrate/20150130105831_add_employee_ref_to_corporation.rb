class AddEmployeeRefToCorporation < ActiveRecord::Migration
  def change
    add_reference :corporations, :employee, index: true
  end
end
