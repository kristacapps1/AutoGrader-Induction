# spec
require 'rails_helper'

RSpec.describe "layouts/_navbar", type: :view do
    it "renders navigation bar" do
        assign(:current_user, User.new())
        @user.update({:first_name => "Joe"})
        render
        # Unable to test anything else without link or input ids
    end
end
