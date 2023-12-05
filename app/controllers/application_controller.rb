class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :city, :comedian_bio, :comedian_name, :comedian_profile_pic, :email, :producer_bio, :producer_name, :producer_profile_pic, :short_comedian_bio, :state])
  end
end
