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
	Given An outcome has the following direct assessment associated with it:
	|Subject Number	|Subject Name|Semester|Assignment Name|Assignment Description|Problem Description|Minimum Grade	|Target Pct	|Act Pct	|
	|18.03 |Diff Eq|2015FA|Exam 1 	|First Order Equations	|Heat transfer|8 out of 10|80|90|
	Then The user sees the link to existing assessments

Scenario: A user sees link to existing assessments
	Given An outcome has the following direct assessment associated with it:
	|Subject Number	|Subject Name|Semester|Assignment Name|Assignment Description|Problem Description|Minimum Grade	|Target Pct	|Act Pct	|
	|18.03 |Diff Eq|2015FA|Exam 1 	|First Order Equations	|Heat transfer|8 out of 10|80|90|
	And The user sees the link to existing assessments
	When The user clicks the link to existing assessments
	Then The user sees the existing assessments