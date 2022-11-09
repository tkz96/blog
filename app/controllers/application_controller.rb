# frozen_string_literal: true

# class ApplicationController < ActionController::Base
#   before_action :update_allowed_parameters, if: :devise_controller?
#   before_action :authenticate_user!
#
#   protected
#   def update_allowed_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#   end
# end

# class ApplicationController < ActionController::Base
#   protect_from_forgery with: :exception
#
#   before_action :update_allowed_parameters, if: :devise_controller?
#
#   protected
#
#   def update_allowed_parameters
#     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
#     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
#   end
# end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    attributes = %i[name email password]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
