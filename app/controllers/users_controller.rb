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
        
        sum_grades = 0
       d = 0;
       if @user.a1grade.to_i >= 0
           sum_grades = sum_grades + @user.a1grade.to_i
           d = d + 1
       end
       if @user.a2grade.to_i >= 0
           sum_grades = sum_grades + @user.a2grade.to_i
           d = d + 1
       end
       if @user.a3grade.to_i >= 0
           sum_grades = sum_grades + @user.a3grade.to_i
           d= d + 1
       end
       if @user.a4grade.to_i >= 0
           sum_grades = sum_grades + @user.a4grade.to_i
           d = d + 1
       end
       if @user.a5grade.to_i >= 0
           sum_grades = sum_grades + @user.a5grade.to_i
           d = d + 1
       end
       if d > 0
       @user.grade = sum_grades / d
       end
       
       
       @user.save
       
       
    a = 0
    b = 0
    c = 0
    d = 0
    f = 0
    User.all.each do |x| 
        if x.grade.to_i == -1
        
        elsif x.grade.to_i >= 90
            a = a + 1
        elsif x.grade.to_i >= 80 && x.grade.to_i < 90
            b = b + 1
        elsif x.grade.to_i >= 70 && x.grade.to_i < 80
            c = c + 1
        elsif x.grade.to_i >= 60 && x.grade.to_i < 70
            d = d + 1
        else
            f = f + 1
        end 
    end
    $grades = [a,b,c,d,f]
        
        
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
           # @assignment_array.push({ "title" => Assignment.last.title, "grade" => 0, "solution" => " " })
          #  user.update_attributes( assignments: @assignment_array)
            user.assignments = user.assignments + [{ "title" => Assignment.last.title, "grade" => 0, "basis" => " ", "induction" => " ", "proof" => " " }]
           # user.assignments_will_change!
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
        params.require(:user).permit(:encrypted_tamu_uin, :class_section, :assignments, :tgrade, :premission, :tbasis, :tinduction, :tproof, :grade)
        
    end
    
   
    
end
  
