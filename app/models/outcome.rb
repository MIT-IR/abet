class Outcome < ActiveRecord::Base
  belongs_to :course, counter_cache: true
  has_many :direct_assessments
  has_many :indirect_assessments
  has_many :surveys
  has_many :participations
  has_many :other_assessments
  has_many :alignments
  accepts_nested_attributes_for :alignments,
    reject_if: ->(attributes) { attributes[:level].blank? }

  delegate :department, to: :course

  def to_s
    "#{name} - #{description}"
  end
end
