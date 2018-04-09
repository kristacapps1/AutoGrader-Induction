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
                expect(@assgctrl.assignments).not_to be_empty
            end
        end
    end
    
    describe "check_creation" do
        context "given i have other assignments" do
           it "checks i can make another assignment" do
               @assgctrl.created
               expect(@assgctrl.count).not_to eq(1)
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
   
   
   
end
