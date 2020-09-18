class AddRuleFieldsToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule_type, :string, null: false, default: ''
    add_column :badges, :rule_value, :string, null: false, default: ''
  end
end
