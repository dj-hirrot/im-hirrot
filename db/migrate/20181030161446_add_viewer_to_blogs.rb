class AddViewerToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :viewer, :integer, default: 0
  end
end
