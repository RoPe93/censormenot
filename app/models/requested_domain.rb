class RequestedDomain < ActiveRecord::Base
  attr_accessible :domain
  
  validates_presence_of :domain
end
