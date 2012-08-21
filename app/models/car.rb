class Car < ActiveRecord::Base
  belongs_to :user
  belongs_to :car_model
  attr_accessible :color, :engine_size, :fuel, :number, :year, :car_model_id, :user_id
end
