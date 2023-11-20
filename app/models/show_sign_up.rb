# == Schema Information
#
# Table name: show_sign_ups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  show_id    :integer
#  user_id    :integer
#
class ShowSignUp < ApplicationRecord
end
