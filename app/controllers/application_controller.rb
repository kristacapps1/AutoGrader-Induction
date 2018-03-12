class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  
  before_filter :require_login

  private
  
    def require_login
      if not current_user
        redirect_to root_path
      end
    end
    
    def require_uin_class
      if current_user.tamu_uin == "" || current_user.class_section == ""
        redirect_to edit_user_path, :flash => { :error => "Please fill in your UIN and select your class section." }
      end
    end
  
end
