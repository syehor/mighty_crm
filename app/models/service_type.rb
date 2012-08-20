class ServiceType < ActiveRecord::Base

  has_and_belongs_to_many :events
  attr_accessible :title

  scope :search, -> name { where("title like ?", "%#{name}%") }

end