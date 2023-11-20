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
#  name                :string
#  show_sign_ups_count :integer
#  state               :string
#  time                :time
#  zip                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  show_type_id        :integer
#  user_id             :integer
#
class Show < ApplicationRecord
end
