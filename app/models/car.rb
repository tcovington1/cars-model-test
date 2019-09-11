class Car < ApplicationRecord
  # validates_presence_of :make
  # validates_uniqueness_of :make
  validates :make, uniqueness: true, presence: true
  # return all cars asc order by model
  def self.by_model
    
  end
  
  # return all cars asc order by make
  def self.by_make

  end

  # if no params passed, it'll go with default param == return asc all the car by mileage
  # :desc order by mileage
  def self.by_mileage(direction = :asc)

  end

  # change the color of car with the param
  def paint(color)

  end
# return a hash of all the cars info, except id and created/update at
  def info

  end
# returns a string of the car horn
  def honk

  end
end
# we need to test to make sure it behaves these ways