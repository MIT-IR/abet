Feature: Course page

Background:
    Given a Touchstone authenticated user
    And a user with access to multiple departments

Scenario: A department's courses are displayed on the department landing page
	Given a department has the following courses:
	|Course Number|Course Name              |
	|2            |Mechanical Engineering        |
	|2A           |MechE Flexible|
	When I view the department's landing page
	Then I should see the department's courses