#assignment tests
require 'rails_helper'

RSpec.describe Assignment, type: :model do
    before do
        @assgn = Assignment.new()
    end
    
    describe ".create" do
        context "given existing assignments" do
            it "check assignment section" do
                expect(@assgn.sections).not_to be_empty
            end
        end
    end
    
    describe "check_sections" do
        context "given i have assignment" do
            it "check sections are right" do
                expect(@assgn.sections).to eq(["501", "502", "503"])
            end
        end
    end
    
    describe "check @@section var" do
        context "given assigmnet created" do
            it "check internal var" do
                expect(@@sections).not_to be_empty
            end
        end
    end
end
