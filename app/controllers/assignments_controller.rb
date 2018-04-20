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
    @user = current_user
    @user.update(user_params)
    redirect_to compare_path
   end
   
   def update_ans
       user = current_user
       user.update!(user_params)
       redirect_to compare_path
   end
   
   def compare
       
       @user = current_user
       @user.assignments[$tassign.to_i]["basis"] = @user.tbasis
       @user.assignments[$tassign.to_i]["induction"] = @user.tinduction
       @user.assignments[$tassign.to_i]["proof"] = @user.tproof
       @user.update!(assignments: @user.assignments)
       
      
       @user.update(tbasis: " ")
       @user.update(tinduction: " ")
       @user.update(tproof: " ")
      
       
       redirect_to assignment_path($tassign.to_i + 1)
   end
    
  
  def show 
     @assignments = Assignment.all
     @user = User.first
     id = params[:id]
    if !id
      id = "1"
    end
    if Assignment.count != 0
     @assignment = Assignment.find(id)
     $tassign = (id.to_i - 1)
    end 
    
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
        params.require(:user).permit(:tamu_uin, :class_section, :assignments, :tbasis, :tinduction, :tproof)
  end
  
end
