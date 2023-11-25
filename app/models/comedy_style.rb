# == Schema Information
#
# Table name: comedy_styles
#
#  id           :integer          not null, primary key
#  comedy_style :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ComedyStyle < ApplicationRecord
  has_many  :comic_styles, class_name: "ComicStyle", foreign_key: "comedy_style_id", dependent: :destroy
end
