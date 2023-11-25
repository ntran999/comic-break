# == Schema Information
#
# Table name: favorite_shows
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  show_id    :integer
#  user_id    :integer
#
class FavoriteShow < ApplicationRecord
belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
belongs_to :show, required: true, class_name: "Show", foreign_key: "show_id"

end
