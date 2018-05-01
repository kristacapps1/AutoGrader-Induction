class AssignmentsController < ApplicationController
 #push comment
  def new
       if Assignment.count == 5
         flash[:notice] = "Max Assignments Already Created"
        redirect_to grader_dashboard_path
       end
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
    @assignment.save
    
    if @assignment.problem == "1*2+2*3+...+n(n+1)=n(n+1)(n+2)/3"
       url = "https://wolfapi.herokuapp.com/1*2+2*3+...+n(n+1)=n(n+1)(n+2)/3\">Q3"
    elsif @assignment.problem == "1+3+5+...+(2n-1)=n*n"
        url = "https://wolfapi.herokuapp.com/1+3+5+...+(2n-1)=n*n\">Q1"
    elsif @assignment.problem == "1*1!+2*2!+...+n*n!=(n+1)!-1"
        url = "https://wolfapi.herokuapp.com/1*1!+2*2!+...+n*n!=(n+1)!-1\">Q2"
    elsif @assignment.problem == "1+2+...+n=(n(n+1))/2"
        url = "https://wolfapi.herokuapp.com/1+2+...+n=(n(n+1))/2\">Q4"
    elsif @assignment.problem == "Prove(1-1/4)(1-1/9)...(1-1/n%5E2)=(n+1)/(2n)"
        url = "https://wolfapi.herokuapp.com/Prove(1-1/4)(1-1/9)...(1-1/n%5E2)=(n+1)/(2n)\">Q5"
    end
        
    require "http"
    $string = HTTP.get(url).to_s
    string2 = HTTP.get(url).to_s
    
    string2 = string2.slice!(0..(string2.index('Result')))
    
    string2 = string2.slice!((string2.index("\""))..string2.length)
    string2[string2.length-1] = ''
    string2[string2.length-1] = ''
    string2[string2.length-1] = ''
    string2[string2.length-1] = ''
    string2[0] = ''
    string2.force_encoding(Encoding::UTF_8)
    $string = $string.slice!(($string.index('Result'))..$string.length)
    $string = $string.slice!(($string.index("\""))..$string.length)
    $string[0] = ''
    $string[$string.length-1] = ''
    $string[$string.length-1] = ''
   @assignment.solution = $string
   @assignment.basis = string2
  @assignment.save
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
       grade = 0
       user.save
       t = user.tproof
       b = user.tbasis
       if t.length >= assignment.solution.to_s.length
       compstring = (t.to_s).slice(t.index(assignment.solution.to_s)..assignment.solution.length + t.index(assignment.solution.to_s)-1)
    
       
       user.save
        if compstring == assignment.solution
          grade = grade + 50
        end
       end
        if b.length >= assignment.basis.to_s.length
        compstring2 = (b.to_s).slice(b.index(assignment.basis.to_s)..assignment.basis.length + b.index(assignment.basis.to_s)-1)
        
        if compstring2 == assignment.basis
          grade = grade + 50
        end
        end
        
      if $tassign == "1"
         user.a1basis = user.tbasis
         user.a1induction = user.tinduction
         user.a1proof = user.tproof
         user.a1grade = grade
      elsif $tassign == "2"
         user.a2basis = user.tbasis
         user.a2induction = user.tinduction
         user.a2proof = user.tproof
        user.a2grade = grade
      elsif $tassign == "3"
         user.a3basis = user.tbasis
         user.a3induction = user.tinduction
         user.a3proof = user.tproof
        user.a3grade = grade
      elsif $tassign == "4"
         user.a4basis = user.tbasis
         user.a4induction = user.tinduction
         user.a4proof = user.tproof
         user.a4grade = grade
      elsif $tassign == "5"
         user.a5basis = user.tbasis
         user.a5induction = user.tinduction
         user.a5proof = user.tproof  
         user.a5grade = grade
      
      end  
      
      #add comparison code here
      #user.tbasis = users final solution/proof
      #assignment.solution = api's solution
     
        user.tbasis = " "
        user.tinduction = " "
        user.tproof = " "
        
       user.save
       
       
       assignment.save
       
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
    
       redirect_to assignment_path($tassign)
   end
    
  
  def show 
      require 'date'
      @date = DateTime.now
     @assignments = Assignment.all
     @user = current_user
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
    params.require(:assignment).permit(:title, :problem, :due_date, :possible_grade, :solution, :basis)
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem

        params.require(:user).permit(:encrypted_tamu_uin, :class_section, :assignments, :tbasis, :tinduction, :tproof, :a1basis, :a1nduction, :a1proof, :a2basis, :a2nduction, :a2proof, :a3basis, :a3nduction, :a3proof, :a4basis, :a4nduction, :a4proof, :a5basis, :a5nduction, :a5proof, :a1grade, :a2grade, :a3grade, :a4grade, :a5grade)

  end
  
end
