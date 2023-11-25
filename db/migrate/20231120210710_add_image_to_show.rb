class AddImageToShow < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :image, :string
  end
end
