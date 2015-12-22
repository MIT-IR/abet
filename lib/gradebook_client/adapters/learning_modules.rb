module GradebookClient
  module Adapters
    class LearningModules
      def assignments_for
        raise NotImplementedError
      end

      def gradebook_for
        raise NotImplementedError
      end

      def histogram_for
        raise NotImplementedError
      end
    end
  end
end
