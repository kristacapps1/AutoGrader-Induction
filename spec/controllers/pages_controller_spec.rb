# spec/pages_controller_spec.rb
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    before do
        @user = User.new()
        @user.update({'uid' => '123456789'})
        @pgCtrl = PagesController.new()
        @assignments = Assignment.new()
        current_user = @user
    end
    describe "index" do
        it "checks that default go to grader dashboard" do
            current_user = @user
            @pgCtrl.index
            expect(request.fullpath).to eq(grader_dashboard_path)
        end
    end
    
    describe "check show" do
        it "checks show sets assignments" do
            @pgCtrl.show
            expect(@assignments).not_to be_empty
        end
    end
    
    describe "check edit" do
        it "checks we can edit user" do
            @pgCtrl.edit
            expect(@pgCtrl.user).not_to be_empty
        end
    end
    
    describe "check update" do
        it "checks we can update user assignments" do
            @pgCtrl.update
            expect(@pgCtrl.user.assignments).not_to be_empty
        end
    end
    
    describe "check input function" do
        context "given i have assignments" do
            it "checks can input the solutions to assignments" do
                @pgCtrl.student_input_and_solution
                expect(@assignments).not_to be_empty
            end
        end
    end
    
    describe "check adding new assignment" do
        context "given i have user" do
            it "checks can add section to user" do
                @pgCtrl.new_assignment
                expect(@assignments.sections).not_to be_empty
            end
        end
    end
    
    describe "check user_params" do
        context "given i have user" do
            it "checks reqiring some params" do
                user_params
                expect(params).not_to be_empty
            end
        end
    end
end
