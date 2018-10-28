class AddIsPinToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :is_pin, :boolean, default: false
  end
end
