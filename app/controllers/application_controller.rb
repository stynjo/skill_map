class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
    end
end
