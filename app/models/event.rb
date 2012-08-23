class Event < ActiveRecord::Base

  EVENT_STATUSES = {inactive: 0, active: 1, postponed: 2}

  attr_accessible :user_id, :car_id, :assigned_to, :end_date, :start_date, :status, :service_tokens, :car_attributes, :user_name, :client_attributes, :car_model_id
  belongs_to :car
  belongs_to :user#, :class_name => "User", :foreign_key => "user_id"
  belongs_to :manager, :class_name => "User", :foreign_key => "created_by"
  belongs_to :assignee, :class_name => "User", :foreign_key => "assigned_to"
  has_and_belongs_to_many :service_types

  accepts_nested_attributes_for :car

  EVENT_STATUSES.each {|k, v| scope k, where(status: v)} 

  def status=(arg)    
    arg = arg.downcase.to_sym
    super EVENT_STATUSES[arg] if EVENT_STATUSES.has_key? arg
  end

  def status
    EVENT_STATUSES.key super
  end

  attr_reader :service_tokens

  def user_name
    client.try :name
  end

  def user_name=(name)
    client = User.find_or_create_by_name(name) if name.present?
  end

  def service_tokens=(tokens)
    self.service_type_ids = ServiceType.ids_from_tokens(tokens)
  end

end