  class RenameComedyStyleToNameInComedyStyles < ActiveRecord::Migration[7.0]
    def change
      rename_column :comedy_styles, :comedy_style, :name
    end
  end
