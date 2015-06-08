class Result < ActiveRecord::Base
  belongs_to :assessment, polymorphic: true
  delegate :department, to: :assessment

  SEMESTERS = ["FA", "JA", "SP"]
  YEARS = ("2014".."2019").to_a
end
