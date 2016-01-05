module GradebookClient
  class Error < RuntimeError
    def gradebook_unavailable?
      message =~ /gradebook with uuid .* is not available/i
    end
  end
end
