require_relative "subjects_client"

class SubjectImporter
  def initialize(term:, department:)
    @term = term
    @department = department
  end

  def run
    service_subjects.each(&method(:import_service_subject))
  end

  private

  attr_reader :term, :department

  def import_service_subject(service_subject)
    subject = Subject.find_or_initialize_by(number: service_subject.number)
    subject.department_number = service_subject.department_number
    subject.title = service_subject.title
    subject.save! if subject.changed?
  end

  def service_subjects
    SubjectsClient::ServiceSubject.where(term: term, department: department)
  end
end
