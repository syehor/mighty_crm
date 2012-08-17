class Event < ActiveRecord::Base
  belongs_to :car
  belongs_to :client, :class_name => "User", :foreign_key => "user_id"
  belongs_to :manager, :class_name => "User", :foreign_key => "created_by"
  belongs_to :assignee, :class_name => "User", :foreign_key => "assigned_to"
  attr_accessible :user_id, :car_id, :assigned_to, :created_by, :end_date, :start_date, :status
end
