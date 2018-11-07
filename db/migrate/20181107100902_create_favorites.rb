class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :blog_id
      t.integer :user_id

      t.timestamps

      t.index :user_id
      t.index :blog_id
      t.index [:user_id, :blog_id], unique: true
    end
  end
end
