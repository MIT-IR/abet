module GradebookClient
  class GradebookAssignment < OpenStruct
    def self.where(gradebook_id:)
      GradebookClient.adapter.gradebook_assignments_for(gradebook_id).map(&method(:new))
    end
  end
end
