class CreateComedyStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :comedy_styles do |t|
      t.string :comedy_style

      t.timestamps
    end
  end
end
