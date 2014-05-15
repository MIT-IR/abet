meche = Department.create(:name => "Mechanical Engineering", :number => "2")
ocean = Course.create(:name => "Ocean Engineering", :number => "2-OE")
meche.courses << ocean
eac_a = Outcome.create(:outcome => 'a',:description => "an ability to apply knowledge of mathematics, science, and engineering")
ocean.outcomes << eac_a
assess = Assessment.create(:assess_type => "direct")
eac_a.assessments << assess
sub_2_016 = Subject.create(:number => "2.016", :name => "Hydrodynamics")
assess.subjects << sub_2_016
pset1 = Measure.create(:name => "Problem Set 1, Question 3", :description => "Evaluates knowledge of fluid dynamics.", :lower_bound => 5, :maximum => 6, :goal => 80)
sub_2_016.measures << pset1
data = DataEntry.create(:semester => "2014SP",:actual => 73)
pset1.data_entries << data
angela = Contact.create(:krbname => "angelao", :email => "angelao@mit.edu",:first_name => "Angela", :last_name => "Mickunas", :position => "Administrative Officer")
markus = Contact.create(:krbname => "mbuehler", :email => "mbuehler@mit.edu", :position => "Department Head")
sub_2_016.instructors << markus
cee = Department.create(:name => "Civil and Environmental Engineering", :number => "1")
cee.contacts << [markus, angela]