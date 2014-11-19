Feature: Add new assessment
When a course has outcomes associated with it
When a user adds a new assessment
Then they are shown a list of available types of assessments

Background:
	Given a Touchstone authenticated user
	And a user with access to multiple departments
	And a department has the following courses:
	|Course Number|Course Name              |
	|2            |Mechanical Engineering        |
	|2A           |MechE Flexible|

Scenario: User chooses to add a new assessment
	Given a user is on the default outcomes page for a course
	When a user chooses to add an assessment for an outcome
	Then a user is given types of assessment to choose from