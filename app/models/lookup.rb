class Lookup < ActiveRecord::Base
  validates :domain, :presence => true
  validates :ip, :presence => true
end
