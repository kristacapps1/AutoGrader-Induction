Feature: Create class and Assignment
  In order for students to have classes and assignments
  As a grader
  I want to be able to add a class or new assignment
  
  Scenario: Find New Class
	Given I am signed in with provider google
    Given I am on the grader dashboard page
    Then I should see "Create a New Class" in a link
    
  Scenario: Create Class
    When I click "Create a New Class"
    And I fill in "Title" with "CSCE 222"
    And I click "Create"
    Then I should see "Class successfully created"
    
  Scenario: Find New Assignment
    Given I am on the grader dashboard page
    Then I should see "Create a New Assignment" in a link
    
  Scenario: Create Assignment
    Given I am on the grader dashboard page
    When I click "Create a New Assignment"
    And I fill in "Title" with "Homework 1"
    And I click "Create"
    Then I should see "Assigment created"

	
	
	
