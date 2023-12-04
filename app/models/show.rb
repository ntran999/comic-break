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
  has_many :show_sign_ups, class_name: "ShowSignUp", foreign_key: "show_id", dependent: :destroy
  has_many :favorite_shows, class_name: "FavoriteShow", foreign_key: "show_id", dependent: :destroy
  belongs_to :show_type, required: true, class_name: "ShowType", foreign_key: "show_type_id", counter_cache: true

  def is_current?
    time >= Time.now
  end

  def is_archived?
    time < Time.now
  end

  scope :location_cont, ->(query) {
      where("city LIKE :query OR state LIKE :query", query: "%#{query}%")
    }
  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "city", "created_at", "date", "description", "google_api_address", "id", "image", "name", "show_sign_ups_count", "show_type_id", "state", "time", "updated_at", "user_id", "venue_name", "zip"]
  end

  def self.ransackable_scopes(auth_object = nil)
    %i[location_cont]
  end

  def self.ransackable_associations(auth_object = nil)
    ["favorite_shows", "show_sign_ups", "show_type", "user"]
  end

end
