class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit :account_update,
      keys: [:name, :birthday, :phone, :avatar, :avatar_cache]
  end

  def load_info rerource
    return if rerource
    render file: "public/404.html", status: :not_found, layout: false
  end
end
