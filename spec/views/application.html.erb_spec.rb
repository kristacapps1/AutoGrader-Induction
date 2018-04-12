# spec
RSpec.describe "layouts/application", type: :view do
    it "renders application" do
        assign(:current_user, User.new())
        render
        # Unable to test anything else without link or input ids
        # Also need some class getters/setters
    end
end
