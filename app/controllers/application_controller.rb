class ApplicationController < ActionController::Base
	  #before_action :authenticate_user!
	  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:gender])
  end
end
