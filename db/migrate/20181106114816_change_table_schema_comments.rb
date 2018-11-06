class ChangeTableSchemaComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_id, :integer, after: :blog_id
  end
end
