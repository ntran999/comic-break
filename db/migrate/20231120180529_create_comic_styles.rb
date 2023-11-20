class CreateComicStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :comic_styles do |t|
      t.integer :user_id
      t.integer :comedy_style_id

      t.timestamps
    end
  end
end
