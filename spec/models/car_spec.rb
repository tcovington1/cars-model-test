require 'rails_helper'

RSpec.describe Car, type: :model do
  # describe 'What a car has' do
  #   it 'has a make' do
  #     make = 'Hummer'
  #     # created for testing
  #     car = Car.create(make: make)
  #     # creating a car with the make being Hummer
  #     expect(car.make).to eq(make)
  #     # expect the make of a car to be Hummer
  #   end
  #   it 'has a model' do
  #     model = 'Civc'
  #     car = Car.create(model: model)
  #     expect(car.model).to eq(model)
  #   end
  #   it '' do
  # end

  it { should respond_to :make }
  it { should respond_to :model }
  it { should respond_to :year }
  it { should respond_to :wheels }
  it { should respond_to :color }
  it { should respond_to :mileage }
# This tests to make sure our table in database has the right columns

# this is going to test that we have the right validations in the model
describe 'validations' do
  it { should validate_uniqueness_of(:make)}
  it { should validate_presence_of(:make)}
end

end

#
