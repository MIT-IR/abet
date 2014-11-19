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
	And a user is on the default outcomes page for a course
	And a user chooses to add an assessment for an outcome

Scenario: User chooses to add a new assessment
	Then a user is given types of assessment to choose from

Scenario: User chooses to create a new direct-type assessment
	When a user chooses a direct-type assessment
	Then a user sees the form for direct-type assessments

Scenario: User chooses to create a new Survey (indirect-type) assessment
	When a user chooses a survey assessment
	Then a user sees the form for survey assessments

Scenario: User chooses to create a new Participation (indirect-type) assessment
	When a user chooses a participation assessment
	Then a user sees the form for participation assessments

Scenario: User chooses to create a new Other (indirect-type) assessment
	When a user chooses an other assessment
	Then a user sees the form for other assessments