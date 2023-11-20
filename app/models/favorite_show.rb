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
end
