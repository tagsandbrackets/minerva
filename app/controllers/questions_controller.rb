require 'minerva'

class QuestionsController < ApplicationController
  def recent
    list_recent_questions.success? do | questions |
      @questions = questions
      render
    end.no_questions? do
      flash[:notice] = "There are no questions, please create one."
      render
    end
  end

  protected
    def list_recent_questions
      Minerva::Contexts::ListRecentQuestions.new(questions).call
    end

    def questions
      Question
    end
end
