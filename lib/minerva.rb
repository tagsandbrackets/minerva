module Minerva
  module Contexts
    class ListRecentQuestions
      def initialize questions
        @questions = questions
      end

      def call
        questions = @questions.recent

        if questions.empty?
          @no_questions = true
        else
          @success = { questions: questions }
        end

        self
      end

      def no_questions? &block
        block.call if @no_questions
        self
      end

      def success? &block
        block.call @success[:questions] if @success
        self
      end
    end
  end

  module Repositories
    module Collection
      include Enumerable

      def initialize elements = []
        @elements = elements
      end

      def each &block
        @elements.each &block
      end

      def << element
        @elements << element
      end
    end

    class Questions
      include Collection

      def recent
        sort_by(&:created_at).reverse
      end
    end
  end

  module Entities
    class Question
      def initialize(title: nil, created_at: nil)
        @title = title.freeze
        @created_at = created_at
        freeze
      end

      attr_reader :title, :created_at
    end
  end
end