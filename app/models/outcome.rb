class Outcome < ActiveRecord::Base
  belongs_to :course, counter_cache: true
  has_many :direct_assessments
  has_many :indirect_assessments
  has_many :surveys
  has_many :participations
  has_many :other_assessments
  has_many :outcome_alignments
  accepts_nested_attributes_for :outcome_alignments,
    reject_if: ->(attributes) { attributes[:alignment_level].blank? }

  delegate :department, to: :course
end
