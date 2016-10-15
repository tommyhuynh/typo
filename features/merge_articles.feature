Feature: Merge articles
  As an admin
  In order to clump similar articles together
  I want to create a merge feature to combine two articles
     
  Scenario: An admin should be able to see the merge button
  	Given the blog is set up
  	And I am logged into the admin panel
  	And I follow "New Article"
  	And I fill in "article_title" with "Tommy Is Cool"
  	And I fill in "article__body_and_extended_editor" with "This is me"
  	And I press "Publish"
  	Then I should see "Manage articles"
  	And I should be on the admin content page
  	And I follow "Tommy Is Cool"
  	Then I should see "Merge Articles"
  
  Scenario: Merge option available to Admin 
    Given the blog is set up
    And I am logged into the admin panel
    When I follow "All Articles"
    And I follow "Edit"
    Then I should see "Merge Articles"

  Scenario: Merge option not available to User
    Given the user blog is set up
    And I am logged into the user panel
    When I follow "All Articles"
    And I follow "Edit"
    Then I should not see "Merge Articles" 

# rails s -p $PORT -b $IP