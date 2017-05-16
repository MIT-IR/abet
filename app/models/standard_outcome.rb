class StandardOutcome < ActiveRecord::Base
  has_many :alignments

  def self.aligned_with(course)
    joins(alignments: { outcome: :course }).where(courses: { id: course })
  end

  def self.unaligned_with(course)
    where.not(id: aligned_with(course))
  end

  def to_s
    "#{label} - #{description}"
  end
end
