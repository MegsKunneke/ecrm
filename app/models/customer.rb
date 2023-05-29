class Customer < ApplicationRecord
  # Other code...

  # Specify the attributes or columns in the database table
  # Make sure you have a column named 'company_name'
  attr_accessor :name, :phone, :email, :company_name, :department

  # Other code...
end
