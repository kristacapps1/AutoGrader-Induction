Feature: Login Page
  In order for each session to be it's own
  As an author
  I want user to be able to login
  
  Scenario: Find title
    Given I am on the login page
    Then I should see "TAMU Induction Auto Grader"
    
  Scenario: Login Button
    When I click login button
    Then I go to Google API page
