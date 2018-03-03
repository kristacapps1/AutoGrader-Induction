require 'rspec'
require "Capybara"
require "Capybara/cucumber"

require_relative "../../myapp"

SITE = "www.protected-dawn-31959.herokuapp.com"
BROWSER = Watir::Browser.start(SITE, :firefox)
PAGES = {
  "Grader Home" => "http://www.protected-dawn-31959.herokuapp.com/"
}

World do
  Capybara.app = MyApp
 
  include Capybara::DSL
  include RSpec::Matchers
end

#Scenario: Grader Page one tests
Given /^I am on the grader home page$/ do
  visit "/GraderHome/"
end

 When /^I click "([^']*)" $/ do |element|
  click_on element
end

Then /^I should see "([^']*)"$/ do |text|
  page.should have_content text
end



#Scenario: Grader Page two tests
Given /^I am on the Grades page$/ do
  visit "/GraderGrades/"
end

When /^I click "([^']*)" $/ do |element|
  click_on element
end

Then /^I should see "([^']*)"$/ do |text|
  page.should have_content text
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector selector, content: text
end


#Scenario: Home Page Tests
Given /^I am on the home page$/ do
  visit "/"
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |element, text|
  fill_in element, with: text
end

Then /^I should see "([^']*)"$/ do |text|
  page.should have_content text
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector selector, content: text
end



#Scenario: Student Page one tests
Given /^I am on the grader home page$/ do
  visit "/GraderHome/"
end

 When /^I click "([^']*)" $/ do |element|
  click_on element
end

Then /^I should see "([^']*)"$/ do |text|
  page.should have_content text
end

Then /^I should see "([^']*)" in a link$/ do |text|
  page.should have_link text
end


#Scenario: Student Page Two tests
Given /^I am on the grader home page$/ do
  visit "/GraderHome/"
end

 When /^I click "([^']*)" $/ do |element|
  click_on element
end

Then /^I should see "([^']*)"$/ do |text|
  page.should have_content text
end

Then /^I should see "([^']*)" in a link$/ do |text|
  page.should have_link text
end






