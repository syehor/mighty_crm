class Brand < ActiveRecord::Base
  has_many :car_models
  attr_accessible :name
end
