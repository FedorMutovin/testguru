class AddForeignKeyToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference(:questions, :tests, foreign_key: true)
  end
end
