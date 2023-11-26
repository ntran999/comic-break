class AddShortComedianBioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :short_comedian_bio, :text
  end
end
