class Event < ActiveRecord::Base

  attr_accessible :user_id, :car_id, :assigned_to, :created_by, :end_date, :start_date, :status, :service_tokens
  belongs_to :car
  belongs_to :client, :class_name => "User", :foreign_key => "user_id"
  belongs_to :manager, :class_name => "User", :foreign_key => "created_by"
  belongs_to :assignee, :class_name => "User", :foreign_key => "assigned_to"
  has_and_belongs_to_many :service_types

  attr_reader :service_tokens

  def service_tokens=(ids)
    p ids
    self.service_type_ids = ids.split(",")
  end

end
