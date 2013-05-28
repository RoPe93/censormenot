class RequestedDomain < ActiveRecord::Base
  attr_accessible :domain
  
  validates_presence_of :domain
  
  after_create :enqueue
  
  private
    def enqueue
      if Rails.env == "production"
        Censormenot::Sender.delay.send_request self
      else
        Censormenot::Sender.send_request self
      end
    end
end
