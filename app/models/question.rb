class Question < ActiveRecord::Base
  def self.recent
    order(:created_at).limit(10).map &:to_entity
  end

  def to_entity
    Minerva::Entities::Question.new title: self.title, 
      created_at: self.created_at
  end
end