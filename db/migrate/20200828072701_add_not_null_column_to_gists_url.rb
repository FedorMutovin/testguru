class AddNotNullColumnToGistsUrl < ActiveRecord::Migration[5.2]
  def change
    change_column_null :gists, :gist_url, false
  end
end
