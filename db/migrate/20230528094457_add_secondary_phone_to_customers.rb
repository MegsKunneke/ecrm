class AddSecondaryPhoneToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :secondary_phone, :string
  end
end
