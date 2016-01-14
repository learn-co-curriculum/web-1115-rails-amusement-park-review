class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message =  ["Sorry."]
    if user.tickets < attraction.tickets 
      message << "You do not have enough tickets the #{attraction.name}."
    end

    if user.height < attraction.min_height
      message << "You are not tall enough to ride the #{attraction.name}."
    end

    if message.length > 1
      message.join(" ")
    else
      take_the_ride 
    end


    # if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
    #   take_the_ride
    # elsif self.attraction.tickets >= self.user.tickets && you are tall enought
    #   "Sorry, you do not have enough tickets the #{attraction.name}."
    # elsif self.attraction.min_height >= self.user.height && you do have enought tickets
    #   "Sorry, you are not tall enough the #{attraction.name}."
    # eslif you are not tall enought && not enought tickets 
    # "Sorry, neighet "
    # end
  end

  def take_the_ride
    self.user.happiness += self.attraction.happiness_rating
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
  end
end
