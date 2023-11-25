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

belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
belongs_to :show, required: true, class_name: "Show", foreign_key: "show_id", counter_cache: true

end
