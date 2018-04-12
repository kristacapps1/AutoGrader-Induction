class AssignmentsController < ApplicationController
 #push comment
  def new
    @assignment = Assignment.new
  end
  
 
  def count
    @assignment = Assignment.find(params[:id])
    $tassignment = params[:id].to_i - 1
    user = User.find($cuser.to_s)
    redirect_to page_path(user)
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    
    if @assignment.save
      redirect_to update_assignments_path
    else 
      render 'new'
    end
    
    
   
  end
  
   def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    
    redirect_to grader_dashboard_path
   end
  
  def show 
    redirect_to grader_dashboard_path
  end
  
  def assignments
    @assignment = Assignment.all
  end 
  
    class << self
        attr_accessor :assignment
        attr_accessor :user
    end

  
  
  private
  
  def assignment_params
    params.require(:assignment).permit(:title, :problem, :due_date, :possible_grade)
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem
        params.permit(:tamu_uin, :class_section, :assignments)
  end
  
end
