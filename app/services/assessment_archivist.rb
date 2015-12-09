class AssessmentArchivist
  def self.archive(*args)
    new(*args).archive
  end

  def self.unarchive(*args)
    new(*args).unarchive
  end

  def initialize(assessment)
    @assessment = assessment
  end

  def archive
    ActiveRecord::Base.transaction do
      assessment.update!(archived: true)
      assessment.outcomes.update_all <<-SQL
        archived_assessments_count = archived_assessments_count + 1
      SQL
    end
  end

  def unarchive
    ActiveRecord::Base.transaction do
      assessment.update!(archived: false)
      assessment.outcomes.update_all <<-SQL
        archived_assessments_count = GREATEST(0, archived_assessments_count - 1)
      SQL
    end
  end

  private

  attr_reader :assessment
end
