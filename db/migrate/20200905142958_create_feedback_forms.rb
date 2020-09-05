class CreateFeedbackForms < ActiveRecord::Migration[5.2]
  def change
    create_table :feedback_forms do |t|
      t.string :text, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
