class PagesController < ApplicationController
  skip_before_filter :require_login, :only=>[:index]
  
  before_filter :require_uin_class, :except=>[:index]
  
  
  def index
    if(current_user)
      redirect_to grader_dashboard_path
    end
  end
  
  def grader_dashboard
    @sections = Assignment.sections
    @users = User.all
  end
  
  def grader_student_solution
    @assignments = Assignment.all
  end
  
  def student_input_and_solution
     @assignments = Assignment.all
  end
  
  def new_assignment
     User.add_section
  end

end
