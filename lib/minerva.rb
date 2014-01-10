module Minerva
  module Contexts
    class ListRecentQuestions
      def initialize questions
        @questions = questions
      end

      def call
        questions = @questions.recent

        if questions.empty?
          @no_questions = -> (handler) { handler.call }
        else
          @success = -> (handler) { handler[questions] }
        end

        self
      end

      def no_questions? &block
        @no_questions.call block if @no_questions
      end

      def success? &block
        @success.call block if @success
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