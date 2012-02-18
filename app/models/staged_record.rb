class StagedRecord < ActiveRecord::Base
  validate_uniqueness_of :answered_by, :scope => :domain 
end
