ApplicationRecord.transaction do
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
    ["Science and Engineering", "1", "an ability to identify, formulate, and solve complex engineering problems by applying principles of engineering, science, and mathematics"],
    ["Experimentation", "6", "an ability to develop and conduct appropriate experimentation, analyze and interpret data, and use engineering judgment to draw conclusions"],
    ["Design", "2", "an ability to apply engineering design to produce solutions that meet specified needs with consideration of public health, safety, and welfare, as well as global, cultural, social, environmental, and economic factors"],
    ["Teamwork", "5", "an ability to function effectively on a team whose members together provide leadership, create a collaborative and inclusive environment, establish goals, plan tasks, and meet objectives"],
    ["Ethics", "4", "an ability to recognize ethical and professional responsibilities in engineering situations and make informed judgments, which must consider the impact of engineering solutions in global, economic, environmental, and societal contexts"],
    ["Communication", "3", "an ability to communicate effectively with a range of audiences"],
    ["Life-long Learning", "7", "an ability to acquire and apply new knowledge as needed, using appropriate learning strategies"]
  ]

  standard_outcomes.each do |outcome|
    StandardOutcome.find_or_create_by(
      nickname: outcome[0],
      label: outcome[1],
      description: outcome[2],
    )
  end

  Rake::Task["subjects:import"].invoke
end
