Feature: Create and/or Edit Blogs
  As an admin
  In order to organize blogs
  I want to create and edit categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: Goes to categories page
    When I follow "Categories"
    Then I should see "Your category slug."
    