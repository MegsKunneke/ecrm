class ChangeRoleDataTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer, using: 'role::integer', default: 0
  end
end
