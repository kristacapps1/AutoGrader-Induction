class PagesController < ApplicationController
  skip_before_filter :require_login, :only=>[:index]
  
  before_filter :require_uin_class, :except=>[:index]
  
  before_filter :is_student, :only=>[:student_input_and_solution]
  
  before_filter :is_grader, :only=>[:grader_dashboard, :show]

  
  def index
    if(current_user)
      redirect_to grader_dashboard_path
    end
  end
  
  def grader_dashboard
    @sections = Assignment.sections
    @users = User.all
    @grades = Assignment.grades
#    @grades = [0,0,0,0,0]
#    a = 0
#    b = 0
#    c = 0
#    d = 0
#    f = 0
#    @users.each do |x| 
#        if x.grade.to_i > 90
#            a = a + 1
#        elsif x.grade.to_i > 80 && x.grade.to_i < 90
#            b = b + 1
#        elsif x.grade.to_i > 70 && x.grade.to_i < 80
#            c = c + 1
#        elsif x.grade.to_i > 60 && x.grade.to_i < 70
#            d = d + 1
#        else
#            f = f + 1
#        end 
#    end
#    @grades = [a,b,c,d,f]
    
  end
  
   def show
    @n = $tassignment
    @assignments = Assignment.all
    id = params[:id]
    @users = User.find(id)
    $cuser = id.to_i
   end
   
   def edit 
     @user = User.find params[:id]
     @@user_update = @user
     
   end
   
  def update
    @user = User.find params[:id]
    @user.update(user_params)
    
      if $tassignment == "1"
         @user.a1grade = @user.tgrade
         
         
      elsif $tassignment == "2"
         @user.a2grade = @user.tgrade
         
      
      elsif $tassignment == "3"
         @user.a3grade = @user.tgrade
         
    
      elsif $tassignment == "4"
         @user.a4grade = @user.tgrade
         
      elsif $tassignment == "5"
         @user.a5grade = @user.tgrade
          
      
      end  
     @user.update(user_params)
     @user.save
    redirect_to page_path(@user)
  end
  
  
  def new_assignment
     User.add_section
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem
        params.require(:user).permit(:tamu_uin, :class_section, :assignments, :tgrade, :a1grade, :a2grade, :a3grade, :a4grade, :a5grade)
  end
  
  


end
