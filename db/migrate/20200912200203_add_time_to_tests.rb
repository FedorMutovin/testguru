class AddTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time, :integer, null: false, default: 1
  end
end
