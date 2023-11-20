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
end
