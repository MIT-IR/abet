module GradebookClient
  class Gradebook < OpenStruct
    def self.find_by_uuid(uuid)
      new(GradebookClient.adapter.gradebook_for(uuid))
    end

    def id
      gradebookId
    end
  end
end
