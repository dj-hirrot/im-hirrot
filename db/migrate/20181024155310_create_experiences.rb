class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :url
      t.datetime :beginning_at
      t.datetime :quit_at

      t.timestamps
    end
  end
end
