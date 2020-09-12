class AddReasonToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :reason, :string, null: false, default: :Reason
  end
end
