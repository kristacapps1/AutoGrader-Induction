class AssignmentsController < ApplicationController
 
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    
    if @assignment.save
      redirect_to @assignment
    else 
      render 'new'
    end
  end
  
  def show 
    redirect_to grader_dashboard_path
  end
  
  def assignments
    @assignment = Assignment.all
  end 
  

  
  
  private
  
  def assignment_params
    params.require(:assignment).permit(:title, :problem, :due_date, :possible_grade)
  end
  
end
