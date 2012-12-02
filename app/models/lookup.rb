class Lookup < ActiveRecord::Base
  validates :domain, :presence => true
  validates :ip, :presence => true
  
  attr_accessible :domain, :ip, :trust

  #validates_uniqueness_of :ip, :score => [:domain]

  before_validation(:on => :create) do
    return Lookup.where(:domain => domain, :ip => ip).size == 0
  end

  def to_answer
    "censormenot|a|#{self.domain}|#{self.ip}|#{self.trust}"
  end
end
