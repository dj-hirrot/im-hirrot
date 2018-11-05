class AddPublicScopeToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :public_scope, :integer, default: 0
  end
end
