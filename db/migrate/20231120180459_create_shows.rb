class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.integer :user_id
      t.string :name
      t.time :time
      t.datetime :date
      t.text :description
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :google_api_address
      t.integer :show_type_id
      t.integer :show_sign_ups_count

      t.timestamps
    end
  end
end
