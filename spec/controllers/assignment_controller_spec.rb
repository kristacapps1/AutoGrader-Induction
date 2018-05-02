#unit tests for assignment controller
require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do
    before do
        @user = User.new()
        @assgctrl = AssignmentsController.new()
    end
    
    describe "check_assignments" do
        context "given i created a new assignment ctrl" do
            it "checks an assignment was made" do
                @assgctrl.new
                expect(@assgctrl.assignment).not_to be_empty
            end
        end
    end
    
    describe "check_count" do
        context "given i have some assignments" do
            it "checks count finds assignment" do
                @assgctrl.count
                expect(@assgctrl.assignment).to eql.(Assignment.find(params[:id]))
            end
            it "checks global var" do
                expect($tassignment).to eql("1")
            end
        end
    end
    
    describe "check_count redirect" do
        context "given i have some assignments" do
            it "checks counting them redirects" do
                @assgctrl.count
                expect(current_path).to eq page_path(User.find($cuser.to_s))
            end
        end
    end
    
    describe "check_count tassgn" do
        context "given i have some assignments" do
            it "checks count gets params" do
                @assgctrl.count
                expect($tassignment).to include(params[:id].to_i-1)
            end
        end
    end
    
    describe "check_update" do
        context "given i have a user" do
            it "updates attributes and checks them" do
                @assgctrl.update
                expect(@assgctrl.user).not_to eql(Assignment.new)
            end
            it "makes sure we redirect after update" do
                expect(current_path).to eq grader_dashboard_path
            end
        end
    end

    describe "check_update_answ" do
        context "given i have a user" do
            it "updates attributes and checks them" do
                @assgctrl.update_ans
                expect(@assgctrl.user).not_to eql(Assignment.new)
            end
            it "makes sure we redirect after update" do
                expect(current_path).to eq compare_path
            end
        end
    end

    describe "check_compare" do
        context "given i have a user" do
            it "compares assignments" do
                @assgctrl.compare
                expect(@assgctrl.user).not_to eql(User.new)
            end
            it "makes sure we redirect after update" do
                expect(current_path).to eq assignment_path($tassign)
            end
        end
    end
    
    describe "check_creation" do
        context "given i have other assignments" do
           it "checks i can make another assignment" do
               @assgctrl.create
               expect(@assgctrl.assignment.params).not_to be_empty
           end
           it "checks i redirect to update path afterwards" do
               @assgctrl.create
               if @assgctrl.save
                   expect(current_path).to eql(update_assignments_path)
                   else
                   response.should render_template('new')
               end
           end
        end
    end
    
   
   describe "check_show" do
       context "given i have some assignments" do
           it "checks show takes me to grader dash" do
               @assgctrl.show
               expect(current_path).to eq grader_dashboard_path
           end
       end
   end
   
   describe "check_assignments" do
       it "checks assgn func" do
           @assgctrl.assignments
           expect(@assgctrl.assignment).to eql(Assignment.all)
        end
    end
   
end
