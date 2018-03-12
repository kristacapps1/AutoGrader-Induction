class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def edit
        @user = current_user
    end
    
    def update_user
        @user = current_user
        if @user.update(user_params)
          # Sign in the user by passing validation in case their password changed
          bypass_sign_in @user, scope: :user
          redirect_to grader_dashboard_path
        end
    end
    
    private
    
    def user_params
        # NOTE: Using `strong_parameters` gem
        params.require(:user).permit(:tamu_uni, :class_section)
    end
end
  