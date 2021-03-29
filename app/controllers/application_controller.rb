class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:show, :index]
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource
    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture, :age, :hobby, :motto, :self, :user_image])
    end
    
    def layout_by_resource
        if devise_controller?
            "devise_layout"
        else
            "application"
        end
    end
end