class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  
  before_filter :require_login

  private
    
    def is_student
      if current_user.premission != "student" && current_user.premission != "admin"
        redirect_to grader_dashboard_path
      end
    end
    
    def is_grader
      if current_user.premission != "grader" && current_user.premission != "admin"
        redirect_to student_input_and_solution_path
      end
    end
    
    def require_login
      if not current_user
        redirect_to root_path
      end
    end
    
    def require_uin_class
      if current_user.encrypted_tamu_uin == "" || current_user.class_section == ""
        redirect_to edit_user_path, :flash => { :error => "Please fill in your UIN and select your class section." }
      end
    end
  
end
