module GradebookClient
  class Assignment < OpenStruct
    def self.where(gradebook_id:)
      GradebookClient.adapter.assignments_for(gradebook_id).map(&method(:new))
    end
  end
end
