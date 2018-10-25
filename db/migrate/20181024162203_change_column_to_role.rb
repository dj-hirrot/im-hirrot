class ChangeColumnToRole < ActiveRecord::Migration[5.2]
  def change
    rename_column :roles, :role, :auth
  end
end
