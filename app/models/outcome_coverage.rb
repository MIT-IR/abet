class OutcomeCoverage < ActiveRecord::Base
  belongs_to :coverage
  belongs_to :outcome, required: true

  has_one :assignment

  delegate :label, :nickname, to: :outcome, prefix: true
end
