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