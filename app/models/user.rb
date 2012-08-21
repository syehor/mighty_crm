class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
 
  has_many :cars 
  has_many :events 
  has_many :created_events, :class_name => "Event", :foreign_key => "created_by" 
  has_many :assigned_events, :class_name => "Event", :foreign_key => "assigned_to"

end
