class ChangeColumnToExperience < ActiveRecord::Migration[5.2]
  def change
    rename_column :experiences, :url, :reference_url
  end
end
