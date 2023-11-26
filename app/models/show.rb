# == Schema Information
#
# Table name: shows
#
#  id                  :integer          not null, primary key
#  address             :text
#  city                :string
#  date                :datetime
#  description         :text
#  google_api_address  :string
#  image               :string
#  name                :string
#  show_sign_ups_count :integer
#  state               :string
#  time                :time
#  venue_name          :string
#  zip                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  show_type_id        :integer
#  user_id             :integer
#
class Show < ApplicationRecord


belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
has_many  :show_sign_ups, class_name: "ShowSignUp", foreign_key: "show_id", dependent: :destroy
has_many  :favorite_shows, class_name: "FavoriteShow", foreign_key: "show_id", dependent: :destroy
belongs_to :show_type, required: true, class_name: "ShowType", foreign_key: "show_type_id", counter_cache: true
  
end
