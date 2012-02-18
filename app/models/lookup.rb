class Lookup < ActiveRecord::Base
  validates :domain, :presence => true
  validates :ip, :presence => true

  #validates_uniqueness_of :ip, :score => [:domain]

  before_validation(:on => :create) do
    return Lookup.where(:domain => domain, :ip => ip).size == 0
  end
end
