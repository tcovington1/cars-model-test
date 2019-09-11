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

describe 'class methods' do
  before(:each) do
    @car1 = Car.create(make: 'Tesla', model: 'TZ', mileage: 0 )
    @car2 = Car.create(make: 'Honda', model: 'Accord', mileage: 1234 )
    @car3 = Car.create(make: 'Kia', model: 'Optima', mileage: 145000 )
  end

  it 'should sort by make :asc' do
    expect(Car.by_make).to eq([@car2, @car3, @car1])
  end

  it 'should sort by model :asc' do
    expect(Car.by_model).to eq([@car2, @car3, @car1])
  end

  it 'should sort by mileage :asc' do
    expect(Car.by_mileage).to eq([@car1, @car2, @car3])
  end

  it 'should sort by mileage :desc' do
    expect(Car.by_mileage(:desc)).to eq([@car3, @car2, @car1])
    # we have to add :desc to give it a param or else itll be defauls
  end
end

describe 'instance methods' do
  before(:each) do
    @attr = {
      make: 'Toyota',
      model: 'Prius',
      color: 'Purple',
      mileage: 100000,
      wheels: true,
      year: 2012
    }

    @car = Car.create(@attr)
  end
  it 'should paint the car' do
    @car.paint('Blue')
    expect(@car.color).to eq('Blue')
  end

  it 'should return the cars info' do
    expect(@car.info).to eq(@attr.with_indifferent_access)
  end

  it 'should honk' do
    expect(@car.honk).to eq('Loud!!!')
  end
end

end

#
