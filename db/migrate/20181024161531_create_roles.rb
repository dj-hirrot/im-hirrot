class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.string :role

      t.timestamps
    end
  end
end
