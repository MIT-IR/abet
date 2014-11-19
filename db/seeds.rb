# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
	Department.find_or_create_by(name: "Civil and Environmental Engineering", role_department: "D_CEE Civil & Environmental Engineering")
	Department.find_or_create_by(name: "Mechanical Engineering", role_department: "D_MECHE Mechanical Engineering")
	Department.find_or_create_by(name: "DMSE", role_department: "D_DMSE Dept Material Science and Engineering")
	Department.find_or_create_by(name: "EECS", role_department: "D_EECS Electrical Engineering & Computer Science")
	Department.find_or_create_by(name: "Chemical Engineering", role_department: "D_CHEME Chemical Engineering")
	Department.find_or_create_by(name: "Aero Astro", role_department: "D_AEROASTRO Aeronautics and Astronautics")
	Department.find_or_create_by(name: "Nuclear Science and Engineering", role_department: "D_NUCENG Nuclear Science and Engineering")
	courses = [["1-C", "Civil Engineering", "Civil and Environmental Engineering"],
	["1-E", "Environmental Engineering", "Civil and Environmental Engineering"],
	["1-ENG", "CEE Flexible", "Civil and Environmental Engineering"],
	["2", "Mechanical Engineering", "Mechanical Engineering"],
	["2-A", "MechE Flexible", "Mechanical Engineering"],
	["2-OE", "Mechanical and Ocean Engineering", "Mechanical Engineering"],
	["3", "Materials Science and Engineering", "DMSE"],
	["6-1", "Electrical Science and Engineering", "EECS"],
	["6-2", "Electrical Engineering and Computer Science", "EECS"],
	["6-3", "Computer Science and Engineering", "EECS"],
	["10", "Chemical Engineering", "Chemical Engineering"],
	["10-B", "Chemical and Biological Engineering", "Chemical Engineering"],
	["10-ENG", "ChemE Flexible", "Chemical Engineering"],
	["16", "Aerospace Engineering", "Aero Astro"],
	["16-ENG", "Aerospace Flexible", "Aero Astro"],
	["22", "Nuclear Engineering", "Nuclear Science and Engineering"]]
	courses.each do |course|
		dept = Department.find_by_name(course.last)
		Course.find_or_create_by(course_number: course[0], 
			course_name: course[1],
			department: dept)
	end
end

