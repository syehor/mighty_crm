class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :color, :engine_size, :fuel, :number, :year, :car_model_id
end
