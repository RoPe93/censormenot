class StagedRecord < ActiveRecord::Base
  validates_uniqueness_of :answered_by, :scope => :domain
end
