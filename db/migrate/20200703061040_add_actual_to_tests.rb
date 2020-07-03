class AddActualToTests < ActiveRecord::Migration[5.2]
  def change
    def change
      add_column :tests, :actual, :boolean, default: true
    end
  end
end
