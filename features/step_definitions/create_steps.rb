Given("I am on the grader dashboard page") do
    visit "/grader_dashboard"
end

Given("I am on the login page") do
    visit "/"
end

When("I click login button") do
    click_on signin
end

Then("I go to Google API page") do
    assert page.has_content?("Sign in with Google")
end

Then("I should see {string}  #This can be changed, however there should probably be a page description.") do |string|
    assert page.has_content?(string) # Write code here that turns the phrase above into concrete actions
end

When("I select from {string} with {string}") do |string, string2|
    pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string} #Again this is only a suggestion, however some form of input verification would probably be good.") do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

