class CreateAnswers < ActiveRecord::Migration[5.2]
  def up
    create_table :answers do |t|
      t.references(:question)
      t.string :body

      t.timestamps
    end
  end

  def down
    drop_table :answers
  end
end
