# == Schema Information
#
# Table name: show_types
#
#  id          :integer          not null, primary key
#  name        :string
#  shows_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ShowType < ApplicationRecord
  has_many  :shows, class_name: "Show", foreign_key: "show_type_id", dependent: :destroy
end
