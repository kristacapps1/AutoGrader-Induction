Feature: User updates their information
  In order to provide information on myself
  As a User
  I want to submit my UIN and class section

Scenario: View update page
  Given I am on "/user/edit"
  Then I should see "Please enter your information below."  #This can be changed, however there should probably be a page description.
  
Scenario: Find the link to the update
  Given I am on "/user/edit"
  Then I should see "Update User" in a link
  
Scenario: Fill out form
    Given I am on "/user/edit"
    When I fill in "text_field" with "123456789"
    And I select from "section" with "501"
    And I click "Update User"
    Then I should see "Information successfully updated." #Again this is only a suggestion, however some form of input verification would probably be good.
