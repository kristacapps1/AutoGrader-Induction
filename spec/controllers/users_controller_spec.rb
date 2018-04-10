# spec/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
        @user = User.new()
        @other_user = User.new()
        current_user = @other_user
        @assignment = Assignment.new()
        @userctrl = UsersController.new()
        user_params = {:tamu_uin=>:class_section}
    end
    
    describe "check creation" do
        it "makes sure we can make new user controller" do
            @userctrl = UsersController.new()
        end
    end
    
    describe "check edit" do
        it "makes sure edit takes current user" do
            @userctrl.edit
            expect(@userctrl.user).to eql(current_user)
        end
    end
    
    describe "update_user" do
        it "updates user attributes" do
            #@user.update({:tamu_uin=>:class_section})
            #expect(@user.tamu_uin).not_to be_nil
            @userctrl.update_user
            expect(@user.update(user_params)).not_to be_nil
        end
    end
    
    describe "check update user func" do
        it "updates user to current user" do
            @userctrl.update_user
            expect(@userctrl.user).to eql(current_user)
        end
    end
    
    describe "check update user func updates" do
        it "updates user params" do
            @userctrl.update_user
            expect(@userctrl.user).to eql(current_user)
        end
    end
    
    describe "check getting all users" do
        context "given i have some users" do
            it "checks i can get all the users" do
                @userctrl.update_assignments
                expect(@userctrl.users).to eql(User.all)
            end
        end
    end
    
    describe "check update assignments" do
        context "given i have some users" do
            it "checks i can update the assignments for users" do
                @userctrl.update_assignments
                expect(@userctrl.assignment_array).to  eql(@userctrl.user.assignments)
            end
        end
    end
    
    describe "check new assignmnet was added" do
        context "given i have some users" do
            it "checks i can an assignment for user" do
                @userctrl.update_assignments
                expect(@userctrl.assignment_array).to  include({ "title" => Assignment.last.title, "grade" => 0, "solution" => " " })
            end
        end
    end
    
    describe "check assignments added to the user" do
        context "given i have some users" do
            it "checks new assignments added to user" do
                @userctrl.update_assignments
                expect(@userctrl.user.assignments).to  include(@userctrl.assignment_array)
            end
        end
    end
    
end

