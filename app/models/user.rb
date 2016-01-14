class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness != nil && self.nausea != nil && self.happiness < self.nausea
      "sad"
    else
      "happy"
    end

  end
end
