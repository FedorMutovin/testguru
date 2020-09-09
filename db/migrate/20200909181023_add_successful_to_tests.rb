class AddSuccessfulToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :successful, :boolean, null: false, default: false
  end
end
