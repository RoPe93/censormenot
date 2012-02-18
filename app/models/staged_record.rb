class StagedRecord < ActiveRecord::Base
  validates_uniqueness_of :answered_by, :scope => :domain

  def self.aggregate
    groups = group("domain", "ip")

    groups.each do |group|
      p "Domain: #{group.domain} #{group.ip}"
      records = where(:domain => group.domain, :ip => group.ip)
      average = records.collect(&:trust).sum.to_f/records.length

      average = (average + 0.5) / 2 if records.length < 10

      lookup = Lookup.find_by_domain_and_ip(group.domain, group.ip)
      lookup.update_attributes(:trust => average)
    end
  end

end
