class Employee < ActiveRecord::Base
 has_one :address
 has_one :corporation

 accepts_nested_attributes_for :address, :corporation
end
