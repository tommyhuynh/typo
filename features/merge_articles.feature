Feature: Merge articles
  As an admin
  In order to clump similar articles together
  I want to create a merge feature to combine two articles
  
  Background:
    Given the blog is set up
    Then I create a new article titled "Test" with text "Herro Wurld", author "Tommy", and comment "You da best."
    And I create a new article titled "Testies" with text "Bye Wurld", author "Jack", and comment "You da worst."
    
    
  
  Scenario: Merge option available to Admin 
    Given I am logged into the admin panel
    When I follow "All Articles"
    And I follow "Edit"
    Then I should see "Merge Articles"
    
  Scenario: Merged Articles should containt text of both articles
    Given I am logged into the admin panel
    Given I am on the edit page for article "Test"
    Then I fill in "merge_with" with "2"
    And I click "Merge"
    Then I should see "Herro Wurld" and "Bye Wurld" in the new article "Test"
    
  Scenario: Merged Articles should have one author
    Given I am logged into the admin panel
    Given I am on the edit page for article "Test"
    Then I fill in "merge_with" with "2"
    And I click "Merge"
    Then the new article "Test" should have author "Tommy"
    
  Scenario: Merged Articles should have the comments
    Given I am logged into the admin panel
    Given I am on the edit page for article "Test"
    Then I fill in "merge_with" with "2"
    And I click "Merge"
    Then the new article "Test" should have comments "You da best." and "You da worst."

  Scenario: Merged Articles should have one title
    Given I am logged into the admin panel
    Given I am on the edit page for article "Test"
    Then I fill in "merge_with" with "2"
    And I click "Merge"
    Then the new article should have title "Test"

    
  Scenario: Non-admin is not able to merge articles 
    
    
    





# rails s -p $PORT -b $IP