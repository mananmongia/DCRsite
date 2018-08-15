class ApplicationController < ActionController::Base

  before_action :configure_permitted_paramerters,if: :devise_controller?

  def configure_permitted_paramerters
    devise_parameter_sanitizer.permit(:sign_up , keys:[:name])
    devise_parameter_sanitizer.permit(:account_update , keys:[:name])
  end

  before_action :set_source
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
