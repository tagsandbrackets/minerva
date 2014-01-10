class Question < ActiveRecord::Base
  def self.recent
    order(:created_at).limit(10)
  end
end