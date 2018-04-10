class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def edit
        @user = current_user
    end
    
    def admin_edit_users
        @users = User.all
    end
    
    def update_user
        @user = User.find(params[:id])
        if @user.update(user_params)
          # Sign in the user by passing validation in case their password changed
          #bypass_sign_in @user, scope: :user
          redirect_to grader_dashboard_path
        end
    end
    
    def update_assignments
        @users = User.all
        @users.each  do |user|
            @assignment_array = user.assignments 
            @assignment_array.push({ "title" => Assignment.last.title, "grade" => 0, "solution" => " " })
            user.update_attributes( assignments: @assignment_array)
            user.assignments_will_change!
            user.save
        end
        redirect_to grader_dashboard_path
    end
    
    class << self
        attr_accessor :users
        attr_accessor :user
        attr_accessor :assignment_array
    end
    private
    
    def user_params
        # NOTE: Using `strong_parameters` gem
        params.require(:user).permit(:tamu_uin, :class_section, :assignments, :tgrade, :premission)
        
    end
    
   
    
end
  
