# spec/pages_controller_spec.rb
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    before do
        @user = User.new()
        @user.update({'uid' => '123456789'})
        @pgCtrl = PagesController.new()
        current_user = @user
    end
    describe "index" do
        it "checks that default go to grader dashboard" do
            current_user = @user
            @pgCtrl.index
            expect(request.fullpath).to eq(grader_dashboard_path)
        end
    end
end
