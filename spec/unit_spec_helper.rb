require_relative '../lib/minerva'

module TestDSL
  def list_recent_questions
    Minerva::Contexts::ListRecentQuestions.new(questions)
  end

  def create_questions questions
    questions.each &method(:create_question)
  end

  def create_question attributes
    questions << Minerva::Entities::Question.new(attributes)
  end

  def questions
    @questions ||= Minerva::Repositories::Questions.new
  end
end

RSpec.configure do |config|
  config.include TestDSL
end