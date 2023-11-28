# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  city                   :string
#  comedian_bio           :string
#  comedian_name          :string
#  comedian_profile_pic   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  producer_bio           :string
#  producer_name          :string
#  producer_profile_pic   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  short_comedian_bio     :text
#  show_sign_ups_count    :integer
#  shows_count            :integer
#  state                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :short_comedian_bio, length: { maximum: 150 }

has_many  :show_sign_ups, class_name: "ShowSignUp", foreign_key: "user_id", dependent: :destroy
has_many  :shows, class_name: "Show", foreign_key: "user_id", dependent: :destroy
has_many  :comic_styles, class_name: "ComicStyle", foreign_key: "user_id", dependent: :destroy
has_many  :favorite_shows, class_name: "FavoriteShow", foreign_key: "user_id", dependent: :destroy


def is_comedian?
  comedian_name.present?
end 

def is_producer?
  producer_name.present?
end

def is_producer_and_comedian?
  producer_name.present?
  comedian_name.present?
end

def is_not_comedian?
  !is_comedian?
end

def is_not_producer?
  !is_producer?
end

def has_signed_up_for_show?(show_id)
  show_sign_up = ShowSignUp.find_by(user_id: id, show_id: show_id)
  show_sign_up.present?
end

def has_favorite_for_show?(show_id)
  show_favorite = FavoriteShow.find_by(user_id: id, show_id: show_id)
  show_favorite.present?
end

end
