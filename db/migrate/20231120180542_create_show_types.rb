class CreateShowTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :show_types do |t|
      t.string :name
      t.integer :shows_count

      t.timestamps
    end
  end
end
