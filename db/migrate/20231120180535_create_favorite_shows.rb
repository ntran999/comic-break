class CreateFavoriteShows < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_shows do |t|
      t.integer :show_id
      t.integer :user_id

      t.timestamps
    end
  end
end
