class Event < ActiveRecord::Base

  attr_accessible :user_id, :car_id, :assigned_to, :end_date, :start_date, :status, :service_tokens, :car_attributes
  belongs_to :car
  belongs_to :client, :class_name => "User", :foreign_key => "user_id"
  belongs_to :manager, :class_name => "User", :foreign_key => "created_by"
  belongs_to :assignee, :class_name => "User", :foreign_key => "assigned_to"
  has_and_belongs_to_many :service_types

  accepts_nested_attributes_for :car

  attr_reader :service_tokens

  def service_tokens=(ids)
    self.service_type_ids = ids.split(",")
  end

end
