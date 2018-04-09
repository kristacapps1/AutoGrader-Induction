# spec/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
        @user = User.new()
        @other_user = User.new()
        @assignment = Assignment.new()
    end
    
    describe "check creation" do
        it "makes sure we can make new user controller" do
            @userctrl = UsersController.new()
        end
    end
    
    describe "check edit" do
        it "makes sure edit takes current user" do
            @user = current_user
            expect(@userctrl.edit).to eql(current_user)
        end
    end
    
    describe "update_user" do
        it "updates user attributes" do
            @user.update({:tamu_uin=>:class_section})
            expect(@user.tamu_uin).not_to be_nil
        end
    end
    
    describe "check update assignments" do
        context "given i have some users" do
            it "checks i can update the assignments for users" do
                @userctrl.update_assignments
                expect(@userctrl.user.assignments).not_to be_empty
            end
        end
    end
end

