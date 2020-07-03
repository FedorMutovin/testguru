class AddNotNullTypes < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :level_id, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:questions, :level_id, false)
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
  end
end
