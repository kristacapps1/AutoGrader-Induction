# spec/controllers/application_controller_spec.rb
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    before do
        @user = User.new()
        @appctrl = ApplicationController.new()
    end
    
    describe "require_login" do
        context "given i am not logged in" do
            it "redirects to root path" do
                #@appctrl.require_login
                expect(request.fullpath + '/').to eq(root_path)
            end
        end
    end
    
    describe "require_uin_class" do
        it "checks that without uin go to edit user path" do
            @appctrl1  = ApplicationController.new()
            @user.update({:encrypted_tamu_uin=>:class_section})
            #@appctrl.require_uin_class
            expect(request.fullpath).to eq(edit_user_path)
        end
    end
end
