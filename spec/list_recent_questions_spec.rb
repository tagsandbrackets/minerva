require 'unit_spec_helper'

describe Minerva::Contexts::ListRecentQuestions do
  context 'no questions created' do
    it "should notify that there are no questions" do
      no_questions = false

      list_recent_questions.call.no_questions? do
        no_questions = true
      end

      expect(no_questions).to be_true
    end
  end

  context '3 questions' do
    before do 
      create_questions [
        { title: "Where is my cat?", created_at: Date.new(2014, 04, 05) },
        { title: "Where is my dog?", created_at: Date.new(2014, 04, 06) },
        { title: "Where is my psp?", created_at: Date.new(2014, 04, 01) }
      ]
    end

    it "should list all questions sorted by creation date" do
      success = false

      list_recent_questions.call.success? do |questions|
        success = true

        expect(questions.map(&:title)).to eql [
          "Where is my dog?", 
          "Where is my cat?", 
          "Where is my psp?"
        ]
      end

      expect(success).to be_true
    end
  end
end