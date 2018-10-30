class CreateTrackViewers < ActiveRecord::Migration[5.2]
  def change
    create_table :track_viewers do |t|
      t.integer :user_id
      t.string :landing_on
      t.datetime :landing_at

      t.timestamps
    end
  end
end
