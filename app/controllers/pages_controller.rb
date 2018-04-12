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
    @user.assignments[$tassignment]["grade"] = @user.tgrade
    @user.update( assignments: @user.assignments)
    redirect_to page_path(@user)
  end
  
  
  def new_assignment
     User.add_section
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem
        params.require(:user).permit(:tamu_uin, :class_section, :assignments, :tgrade)
  end
  
  


end
