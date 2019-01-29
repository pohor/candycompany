class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :description, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :description, :avatar])
  end

  def set_search
    @q=Post.joins(:categories).joins(:ingredients).ransack(params[:q])
  end

end
