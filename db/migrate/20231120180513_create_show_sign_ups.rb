class CreateShowSignUps < ActiveRecord::Migration[7.0]
  def change
    create_table :show_sign_ups do |t|
      t.integer :user_id
      t.integer :show_id

      t.timestamps
    end
  end
end
