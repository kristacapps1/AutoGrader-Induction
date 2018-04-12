Given (/^I am on the home page$/) do
  visit "/"
end

Given (/^I am signed in with provider "(.*)"$/) do |provider|
	vist "/auth/#{provider.downcase}"
end

Then (/^I should see "([^"]*)"$/) do |text|
  assert page.has_content?(text)
end

Then (/^I should see "([^"]*)" in the selector "([^"]*)"$/) do |text, selector|
  assert page.has_selector?(selector, content: text)
end

Then (/^I should see "([^"]*)" in a link$/) do |text|
  assert page.has_link?(text)
end

Given (/^I am on "([^"]*)"$/) do |path|
  visit path
end

When (/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end
 
When (/^I click "([^"]*)"$/) do |element|
  click_on element
end

When (/^I select "([^"]*)" from "([^"]*)"$/) do |list, selection| 
  select(selection, :from => list)
end
