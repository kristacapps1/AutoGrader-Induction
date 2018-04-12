# spec/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
    describe ".create" do
        context "given user is not yet logged in" do
            it "has no user info" do
                expect(User.new().email).to be_empty
            end
        end
    end
    describe "check email" do
        context "given new user logged in" do
            it "has an email" do
                expect(User.new().email).to eql(auth.info.email)
            end
        end
    end
end
