class AddPositionToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :position, :string
  end
end
