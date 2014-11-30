Feature: Show assessments if they exist
When an outcome has assessments associated with it
And a user is on the outcomes page for a course
And they click the link to see the existing assessments
Then they see the existing assessments

Background:
	Given a Touchstone authenticated user
	And a user with access to multiple departments
	And a department has the following courses:
	|Course Number|Course Name              |
	|2            |Mechanical Engineering        |
	|2A           |MechE Flexible|
	And a user is on the default outcomes page for a course

Scenario: A user sees link to existing assessments
	Given An outcome has the following assessments associated with it
	Then The user sees the link to existing assessments

Scenario: A user sees link to existing assessments
	Given An outcome has the following assessments associated with it
	And The user sees the link to existing assessments
	When The user clicks the link to existing assessments
	Then The user sees the existing assessments