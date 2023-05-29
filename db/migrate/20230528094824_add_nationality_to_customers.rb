class AddNationalityToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :nationality, :string
  end
end
