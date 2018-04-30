class AssignmentsController < ApplicationController
 #push comment
  def new
    @assignment = Assignment.new
  end
  
 
  def count
    @assignment = Assignment.find(params[:id])
    $tassignment = params[:id]
    if $tassignment == "0"
        $tassignment = "1"
    end
    user = User.find($cuser.to_s)
    redirect_to page_path(user)
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    require "http"
    $string = HTTP.get("https://wolfapi.herokuapp.com/1+3+5+...+(2n-1)=n*n\">Q1").to_s
    $string = $string.slice!(($string.index('Result'))..$string.length)
    $string = $string.slice!(($string.index("\""))..$string.length)
    $string[0] = ''
    $string[$string.length-1] = ''
    $string[$string.length-1] = ''
    @assignment.solution = $string
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
       assignment = Assignment.find($tassign)
       user = current_user
      if $tassign == "1"
         user.a1basis = user.tbasis
         user.a1induction = user.tinduction
         user.a1proof = user.tproof
         
      elsif $tassign == "2"
         user.a2basis = user.tbasis
         user.a2induction = user.tinduction
         user.a2proof = user.tproof
      
      elsif $tassign == "3"
         user.a3basis = user.tbasis
         user.a3induction = user.tinduction
         user.a3proof = user.tproof
    
      elsif $tassign == "4"
         user.a4basis = user.tbasis
         user.a4induction = user.tinduction
         user.a4proof = user.tproof
      elsif $tassign == "5"
         user.a5basis = user.tbasis
         user.a5induction = user.tinduction
         user.a5proof = user.tproof  
      
      end  
      
      #add comparison code here
      #user.tbasis = users final solution/proof
      #assignment.solution = api's solution
        user.tbasis = " "
        user.tinduction = " "
        user.tproof = " "
       user.save
       redirect_to assignment_path($tassign)
   end
    
  
  def show 
     @assignments = Assignment.all
     @user = User.first
     id = params[:id]
    if id == "0"
      id = "1"
    elsif !id
      id="1"
    end
    
    if Assignment.count != 0
     @assignment = Assignment.find(id)
     $tassign = (id)
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
    params.require(:assignment).permit(:title, :problem, :due_date, :possible_grade, :solution)
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem
        params.require(:user).permit(:encrypted_tamu_uin, :class_section, :assignments, :tbasis, :tinduction, :tproof, :a1basis, :a1nduction, :a1proof, :a2basis, :a2nduction, :a2proof, :a3basis, :a3nduction, :a3proof, :a4basis, :a4nduction, :a4proof, :a5basis, :a5nduction, :a5proof)
  end
  
end
