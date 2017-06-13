ActiveRecord::Base.transaction do
  Department.find_or_create_by(name: "Civil and Environmental Engineering", slug: "D_CEE", number: 1)
  Department.find_or_create_by(name: "Mechanical Engineering", slug: "D_MECHE", number: 2)
  Department.find_or_create_by(name: "DMSE", slug: "D_DMSE", number: 3)
  Department.find_or_create_by(name: "EECS", slug: "D_EECS", number: 6)
  Department.find_or_create_by(name: "Chemical Engineering", slug: "D_CHEME", number: 10)
  Department.find_or_create_by(name: "Aero Astro", slug: "D_AEROASTRO", number: 16)
  Department.find_or_create_by(name: "Nuclear Science and Engineering", slug: "D_NUCENG", number: 22)

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
    Course.find_or_create_by(number: course[0],
      name: course[1],
      department: dept)
  end

  standard_outcomes = [
    ["Science and Engineering", "A", "an ability to apply knowledge of mathematics, science, and engineering"],
    ["Experimentation", "B", "an ability to design and conduct experiments, as well as to analyze and interpret data"],
    ["Design", "C", "an ability to design a system, component, or process to meet desired needs within realistic constraints such as economic, environmental, social, political, ethical, health and safety, manufacturability, and sustainability"],
    ["Teamwork", "D", "an ability to function on multidisciplinary teams"],
    ["Problem Solving", "E", "an ability to identify, formulate, and solve engineering problems"],
    ["Ethics", "F", "an understanding of professional and ethical responsibility"],
    ["Communication", "G", "an ability to communicate effectively"],
    ["Broad Education", "H", "the broad education necessary to understand the impact of engineering solutions in a global, economic, environmental, and societal context"],
    ["Life-long Learning", "I", "a recognition of the need for, and an ability to engage in life-long learning"],
    ["Contemporary Issues", "J", "a knowledge of contemporary issues"],
    ["Modern Practice", "K", "an ability to use the techniques, skills, and modern engineering tools necessary for engineering practice"]
  ]

  standard_outcomes.each do |outcome|
    StandardOutcome.find_or_create_by(
      nickname: outcome[0],
      label: outcome[1],
      description: outcome[2],
    )
  end

  Rake::Task["subjects:import"].invoke("2017FA")
end
