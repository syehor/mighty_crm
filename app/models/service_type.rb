class ServiceType < ActiveRecord::Base

  has_and_belongs_to_many :events
  attr_accessible :title

  def self.tokens(name)
    service_types = where("title like ?", "%#{name}%")
    return [id: "<<<#{name}>>>", title: "New: \"#{name}\""] if service_types.empty?
    service_types
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(title: $1).id }
    tokens.split(',')
  end

end