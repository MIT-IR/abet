Given /^a Touchstone authenticated user$/ do
  ENV['eppn'] = "daries@mit.edu"
  Department.create!(name: 'Mechanical Engineering', role_department: 'D_MECHE')
  Department.create!(name: 'Nuclear Engineering', role_department: 'D_NUCENG')
  StandardOutcome.create(name:"a", description:"an ability to apply knowledge of mathematics, science, and engineering")
  StandardOutcome.create(name:"b", description:"an ability to design and conduct experiments, as well as to analyze and interpret data")
end

