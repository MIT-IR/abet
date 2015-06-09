ActiveRecord::Base.transaction do
  Department.find_or_create_by(name: "Civil and Environmental Engineering", slug: "D_CEE")
  Department.find_or_create_by(name: "Mechanical Engineering", slug: "D_MECHE")
  Department.find_or_create_by(name: "DMSE", slug: "D_DMSE")
  Department.find_or_create_by(name: "EECS", slug: "D_EECS")
  Department.find_or_create_by(name: "Chemical Engineering", slug: "D_CHEME")
  Department.find_or_create_by(name: "Aero Astro", slug: "D_AEROASTRO")
  Department.find_or_create_by(name: "Nuclear Science and Engineering", slug: "D_NUCENG")

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
    ["a", "an ability to apply knowledge of mathematics, science, and engineering"],
    ["b", "an ability to design and conduct experiments, as well as to analyze and interpret data"],
    ["c", "an ability to design a system, component, or process to meet desired needs within realistic constraints such as economic, environmental, social, political, ethical, health and safety, manufacturability, and sustainability"],
    ["d", "an ability to function on multidisciplinary teams"],
    ["e", "an ability to identify, formulate, and solve engineering problems"],
    ["f", "an understanding of professional and ethical responsibility"],
    ["g", "an ability to communicate effectively"],
    ["h", "the broad education necessary to understand the impact of engineering solutions in a global, economic, environmental, and societal context"],
    ["i", "a recognition of the need for, and an ability to engage in life-long learning"],
    ["j", "a knowledge of contemporary issues"],
    ["k", "an ability to use the techniques, skills, and modern engineering tools necessary for engineering practice"]
  ]

  standard_outcomes.each do |outcome|
    StandardOutcome.find_or_create_by(name: outcome[0],
      description: outcome[1])
  end

  subject_csv = Rails.root.join("config", "subjects.csv")
  SubjectImporter.new(subject_csv).run
end
