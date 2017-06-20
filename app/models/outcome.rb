class Outcome < ActiveRecord::Base
  attribute :label, Label.new

  belongs_to :course, counter_cache: true

  has_one :department, through: :course
  has_many :outcome_coverages, -> { where archived: false }
  has_many :alignments
  has_many :standard_outcomes, through: :alignments

  accepts_nested_attributes_for :alignments,
    reject_if: ->(attributes) { attributes[:level].blank? },
    allow_destroy: true

  delegate :number, :name, to: :course, prefix: true

  validates :label, presence: true, uniqueness: { scope: :course_id },
    length: { maximum: 5 }
  validates :nickname, presence: true, uniqueness: { scope: :course_id }
  validates :description, presence: true

  has_paper_trail

  def self.alphabetical
    order(:label)
  end

  def to_s
    "#{label} - #{description}"
  end

  def to_short_s
    "#{label} - #{nickname}"
  end
end
