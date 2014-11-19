Feature: System Access

  Background:
    Given a Touchstone authenticated user

  Scenario: User with no access sees access denied page
    Given a user with no access
    When they visit the application
    Then they are sent to the no access page

  Scenario: User with access to multiple departments sees department list
    Given a user with access to multiple departments
    When they visit the application
    Then they see the department chooser page

  Scenario: User with access to a single department sees that department's landing page
    Given a user with access to a single department
    When they visit the application
    Then they see that department's landing page

  Scenario: When a user doesn't have access, and then does, refreshing does the right thing
    Given a user with no access
    And they visit the application
    And then are given rights to a single department
    When they refresh the page
    Then they see that department's landing page

  Scenario: When a user with access to multiple departments chooses a department 
    Given a user with access to multiple departments
    And they visit the application
    When they choose a department
    Then they see that department's landing page

