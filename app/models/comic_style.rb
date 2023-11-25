# == Schema Information
#
# Table name: comic_styles
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  comedy_style_id :integer
#  user_id         :integer
#
class ComicStyle < ApplicationRecord

belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
belongs_to :comedy_style, required: true, class_name: "ComedyStyle", foreign_key: "comedy_style_id"

end
