class AddColumnToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :is_confirm, :boolean, default: false
  end
end
