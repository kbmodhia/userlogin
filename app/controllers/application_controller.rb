class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname,:lastname,:contactno,:address1,:address2,:city,:state,:pincode,:profilepic, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname,:lastname,:contactno,:address1,:address2,:city,:state,:pincode,:profilepic, :email, :password, :current_password)}
          end
end
