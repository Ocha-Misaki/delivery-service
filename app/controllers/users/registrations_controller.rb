# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params
  before_action :configure_account_update_params
  layout "users"

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password plan schedule address usage_count phone_number])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password plan schedule address usage_count phone_number])
  end
end
