class Offering
  attr_reader :subject, :semester, :year

  def initialize(subject:, semester:, year:)
    @subject = subject
    @semester = semester
    @year = year
  end

  def assignments
    @_assignments = GradebookClient::Assignment.where(gradebook_id: gradebook_id)
  end

  def gradebook_id
    @_gradebook_id = GradebookClient::Gradebook.find_by_uuid(uuid).id
  end

  def subject_id
    subject.id
  end

  def to_s
    "#{subject} #{term.upcase}"
  end

  private

  def uuid
    "STELLAR:/course/#{subject.department_number}/#{term}/#{subject.number}"
  end

  def term
    "#{semester}#{year.last(2)}"
  end
end
