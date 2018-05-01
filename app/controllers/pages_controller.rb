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
    @grades = $grades
   
    require 'date'
    date = DateTime.now
    User.all.each do |user|
    if Assignment.count == 1
    if date > Assignment.find("1").due_date && user.a1grade == -1
        user.a1grade = 0
    end
    end
    if Assignment.count == 2
    if date > Assignment.find("2").due_date && user.a2grade == -1
        user.a2grade = 0
    end
    end
    if Assignment.count == 3
    if date > Assignment.find("3").due_date && user.a3grade == -1
        user.a3grade = 0
    end
    end
    if Assignment.count == 4
    if date > Assignment.find("4").due_date && user.a4grade == -1
        user.a4grade = 0
    end
    end
    if Assignment.count == 5
    if date > Assignment.find("5").due_date && user.a5grade == -1
        user.a5grade = 0
    end
    end
    
    sum_grades = 0
       d = 0;
       if user.a1grade.to_i >= 0
           sum_grades = sum_grades + user.a1grade.to_i
           d = d + 1
       end
       if user.a2grade.to_i >= 0
           sum_grades = sum_grades + user.a2grade.to_i
           d = d + 1
       end
       if user.a3grade.to_i >= 0
           sum_grades = sum_grades + user.a3grade.to_i
           d= d + 1
       end
       if user.a4grade.to_i >= 0
           sum_grades = sum_grades + user.a4grade.to_i
           d = d + 1
       end
       if user.a5grade.to_i >= 0
           sum_grades = sum_grades + user.a5grade.to_i
           d = d + 1
       end
       if d > 0
       user.grade = sum_grades / d
       end
       
       
       user.save
       
       
    a = 0
    b = 0
    c = 0
    d = 0
    f = 0
    User.all.each do |x| 
        if x.grade.to_i == -1
        
        elsif x.grade.to_i > 90
            a = a + 1
        elsif x.grade.to_i > 80 && x.grade.to_i < 90
            b = b + 1
        elsif x.grade.to_i > 70 && x.grade.to_i < 80
            c = c + 1
        elsif x.grade.to_i > 60 && x.grade.to_i < 70
            d = d + 1
        else
            f = f + 1
        end 
    end
    $grades = [a,b,c,d,f]
    
    
    
    end
    
    
  
        
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
     
     
    redirect_to page_path(@user)
  end
  
  
  def new_assignment
     User.add_section
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem
        params.require(:user).permit(:encrypted_tamu_uin, :class_section, :assignments, :tgrade, :a1grade, :a2grade, :a3grade, :a4grade, :a5grade)
  end
  
  


end
