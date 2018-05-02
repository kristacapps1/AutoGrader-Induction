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
    eq = "%3d"
    pl = "%2B"
    rp = "%28"
    lp = "%29"
    dv = "%2F"
    ex = "%21"
    tproblem = @assignment.problem
    equation = @assignment.problem.to_s
   for i in 0..(equation.length-1) do
        if equation[i] == "="
           equation[i] = eq
        end
        if equation[i] == "+"
            equation[i] = pl
        end
        if equation[i] == "("
            equation[i] = rp
        end
        if equation[i] == ")"
            equation[i] = lp
        end
        if equation[i] == "/"
            equation[i] = dv
        end
        if equation[i] == " "
            equation[i] = "+"
        end
        if equation[i] == "!"
            equation[i] = ex
        end
   end
    
    url = "http://api.wolframalpha.com/v2/query?appid=U72E65-ARQERXR86Y&input=" + equation + "&podstate=Result__Step-by-step+solution&format=plaintext"
    #$string = url
    $string = HTTP.get(url).to_s
    stringbasis = HTTP.get(url).to_s
#    string2 = HTTP.get(url).to_s
    
#    string2 = string2.slice!(0..(string2.index('Result')))
    
#    string2 = string2.slice!((string2.index("\""))..string2.length)
#    string2[string2.length-1] = ''
#    string2[string2.length-1] = ''
#    string2[string2.length-1] = ''
#    string2[string2.length-1] = ''
#    string2[0] = ''
#    string2.force_encoding(Encoding::UTF_8)
   $string = $string.slice!(($string.index('prove |'))..$string.index("| method"))
   stringbasis = stringbasis.slice!((stringbasis.index('Possible intermediate steps'))..stringbasis.index("infos count="))
   
   
   
   for i in 0..43 do
       stringbasis[0] = ''
   end
   for i in 0..17 do
       stringbasis[stringbasis.length-1] = ''
   end
   while stringbasis.index("&gt;") do
   stringbasis[stringbasis.index("&gt;")] = ">"
   aa = stringbasis.index("gt;")
   ab = aa + 1
   ac = aa
   stringbasis[aa]=''
   stringbasis[ab]=''
   stringbasis[ac]=''
   
   end
   stringproof = stringbasis
   stringinduction = stringbasis
   
   
   
   stringproof = stringproof.slice!(stringproof.index("Answer:")..stringproof.length-1)
   stringbasis = stringbasis.slice!(stringbasis.index("The base case value is n")..stringbasis.index("For each integer n"))
   stringinduction = stringinduction.slice!(stringinduction.index("Consider the following properties")..stringinduction.length-1)
   stringbasis[stringbasis.length-1] = ''
   stringbasis[stringbasis.length-1] = ''
   stringinduction[stringinduction.length-1] = ''
   
   
   @assignment.basis = stringbasis
   @assignment.induction = stringinduction
   
   
#    $string = $string.slice!(($string.index("\""))..$string.length)
#    $string[0] = ''
#    $string[$string.length-1] = ''
#    $string[$string.length-1] = ''
   @assignment.solution = stringproof
#   @assignment.basis = string2
#  @assignment.save
@assignment.problem = $string
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
       
       compstring = t
       compstring2 = b
       
       user.save
        
       
        
        
        
        if assignment.solution.include? "true" and compstring.include? "true"
          grade = grade + 50
        elsif assignment.solution.include? "false" and compstring.include? "false"
          grade = grade + 50
        end
        
        if assignment.basis.include? compstring2
          grade = grade + 50
        elsif assignment.basis == compstring2
            grade = grade + 50
        end
        
        ot = "0"
        if DateTime.now > assignment.due_date
            ot = "1"
        end
      if $tassign == "1"
         user.a1basis = user.tbasis
         user.a1induction = user.tinduction
         user.a1proof = user.tproof
         user.a1grade = grade
         user.a1ot = ot
         
      elsif $tassign == "2"
         user.a2basis = user.tbasis
         user.a2induction = user.tinduction
         user.a2proof = user.tproof
        user.a2grade = grade
        user.a2ot = ot
      elsif $tassign == "3"
         user.a3basis = user.tbasis
         user.a3induction = user.tinduction
         user.a3proof = user.tproof
        user.a3grade = grade
        user.a3ot = ot
      elsif $tassign == "4"
         user.a4basis = user.tbasis
         user.a4induction = user.tinduction
         user.a4proof = user.tproof
         user.a4grade = grade
         user.a4ot = ot
      elsif $tassign == "5"
         user.a5basis = user.tbasis
         user.a5induction = user.tinduction
         user.a5proof = user.tproof  
         user.a5grade = grade
         user.a5ot = ot
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
    params.require(:assignment).permit(:title, :problem, :due_date, :possible_grade, :solution, :basis, :induction)
  end
  
  def user_params
        # NOTE: Using `strong_parameters` gem

        params.require(:user).permit(:encrypted_tamu_uin, :class_section, :assignments, :tbasis, :tinduction, :tproof, :a1basis, :a1nduction, :a1proof, :a2basis, :a2nduction, :a2proof, :a3basis, :a3nduction, :a3proof, :a4basis, :a4nduction, :a4proof, :a5basis, :a5nduction, :a5proof, :a1grade, :a2grade, :a3grade, :a4grade, :a5grade, :a1ot, :a2ot, :a3ot, :a4ot, :a5ot)

  end
  
end
