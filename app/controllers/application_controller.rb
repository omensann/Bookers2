class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:root, :about, :new_user_registration, :new_user_session]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
    user_path(@user)
  end

  def after_sign_out_path_for(resouce)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email])
  end
end
