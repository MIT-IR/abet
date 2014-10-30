# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# load the departments, courses and the ABET outcomes
# need to rewrite as load script from a file
depts = [["1", "Civil and Environmental Engineering"], 
["2", "Mechanical Engineering"],
["3", "Materials Science and Engineering"],
["6", "Electrical Engineering and Computer Science"],
["10", "Chemical Engineering"],
["16", "Aeronautics and Astronautics"],
["20", "Biological Engineering"],
["22", "Nuclear Science and Engineering"]]
courses = [["1-C", "Civil Engineering", "1"],
["1-E", "Environmental Engineering", "1"],
["1-ENG", "CEE Flexible", "1"],
["2", "Mechanical Engineering", "2"],
["2-A", "MechE Flexible", "2"],
["2-OE", "Mechanical and Ocean Engineering", "2"],
["3", "Materials Science and Engineering", "3"],
["6-1", "Electrical Science and Engineering", "6"],
["6-2", "Electrical Engineering and Computer Science", "6"],
["6-3", "Computer Science and Engineering", "6"],
["10", "Chemical Engineering", "10"],
["10-B", "Chemical and Biological Engineering", "10"],
["10-ENG", "ChemE Flexible", "10"],
["16", "Aerospace Engineering", "16"],
["16-ENG", "Aerospace Flexible", "16"],
["20", "Biological Engineering", "20"],
["22", "Nuclear Engineering", "22"]]
abet_ak = [['a', 'EAC', "an ability to apply knowledge of mathematics, science, and engineering"],
['b', 'EAC', "an ability to design and conduct experiments, as well as to analyze and interpret data"],
['c', 'EAC', "an ability to design a system, component, or process to meet desired needs within realistic constraints such as economic, environmental, social, political, ethical, health and safety, manufacturability, and sustainability"],
['d', 'EAC', "an ability to function on multidisciplinary teams"],
['e', 'EAC', "an ability to identify, formulate, and solve engineering problems"],
['f', 'EAC', "an understanding of professional and ethical responsibility"],
['g', 'EAC', "an ability to communicate effectively"],
['h', 'EAC', "the broad education necessary to understand the impact of engineering solutions in a global, economic, environmental, and societal context"],
['i', 'EAC', "a recognition of the need for, and an ability to engage in life-long learning"],
['j', 'EAC', "a knowledge of contemporary issues"],
['k', 'EAC', "an ability to use the techniques, skills, and modern engineering tools necessary for engineering practice"]]
depts.each do |dept|
	Department.create(:number => dept[0], :name => dept[1], :sort_num => dept[0].to_i)
end
courses.each do |course|
	new_course = Course.create(:number => course[0], :name => course[1])
	dept = Department.find_by_number(course[2])
	dept.courses << new_course
	abet_ak.each do |abet_outcome|
		new_outcome = Outcome.create(:outcome => abet_outcome[0], :commission => abet_outcome[1], :description => abet_outcome[2])
		new_course.outcomes << new_outcome
	end
end

