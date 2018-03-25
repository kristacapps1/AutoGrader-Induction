# spec/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
        @user = User.new()
    end
    
    describe "update_user" do
        it "updates user attributes" do
            @user.update({:tamu_uin=>:class_section})
            expect(@user.tamu_uin).not_to be_nil
        end
    end
end

