class CarModel < ActiveRecord::Base
  belongs_to :brand
  has_many :cars
  attr_accessible :name, :car_model_attributes
end
