class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.boolean :is_publish
      t.datetime :published_on

      t.timestamps
    end
  end
end
