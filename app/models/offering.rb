class Offering
  def initialize(subject:, semester:, year:)
    @subject = subject
    @semester = semester
    @year = year
  end

  def assignments
    @_assignments = gradebook_client.assignments_for(gradebook_id)
  end

  def gradebook_id
    @_gradebook_id = gradebook_client.gradebook_id_for(uuid)
  end

  def to_s
    "#{subject} #{term.upcase}"
  end

  private

  attr_reader :subject, :semester, :year

  def uuid
    "STELLAR:/course/#{subject.department_number}/#{term}/#{subject.number}"
  end

  def term
    "#{semester}#{year.last(2)}"
  end

  def gradebook_client
    GradebookClient.new
  end
end
