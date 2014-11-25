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

Scenario: User submits data to the direct-type assessment form
	Given a user is given types of assessment to choose from
	And a user chooses a direct-type assessment
	And a user sees the form for direct-type assessments
	When fills out the form with the following items:
	|direct_assessment_subject_number				|18.02					|
	|direct_assessment_subject_description			|Multivariable Calculus	|
	|direct_assessment_assignment_name				|Pset 1 				|
	|direct_assessment_assignment_description		|Integration by parts	|
	|direct_assessment_minimum_grade				|7 out of 10			|
	|direct_assessment_target_percentage			|80						|
	|direct_assessment_actual_percentage			|94						|
	And user clicks the submit button
	Then user sees the list of assessments