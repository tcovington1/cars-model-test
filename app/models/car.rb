class Car < ApplicationRecord
  # validates_presence_of :make
  # validates_uniqueness_of :make
  validates :make, uniqueness: true, presence: true
  # return all cars asc order by model
  def self.by_model
    order(:model)
  end
  
  # return all cars asc order by make
  def self.by_make
    order(:make)
  end

  # if no params passed, it'll go with default param == return asc all the car by mileage
  # :desc order by mileage
  def self.by_mileage(direction = :asc)
    # Car.order(mileage: :asc)
    # Car.order(mileage: :desc)
    # since we already have params and default params
    order(mileage: direction)
  end

  # change the color of car with the param
  def paint(color)
    self.update(color: color)
  end
# return a hash of all the cars info, except id and created/update at
  def info
    self.attributes.except('id', 'created_at', 'updated_at')
  end
# returns a string of the car horn
  def honk
    'Loud!!!'
  end
end
# we need to test to make sure it behaves these ways