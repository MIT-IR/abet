module SubjectsClient
  class ServiceSubject < OpenStruct
    def self.where(term:, department:)
      SubjectsClient.
        adapter.
        subjects_for(term: term, department: department).
        map(&method(:new))
    end

    def number
      subjectId
    end

    def name
      title
    end

    def department_number
      number.split(".").first
    end
  end
end
