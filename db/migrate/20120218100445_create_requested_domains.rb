class CreateRequestedDomains < ActiveRecord::Migration
  def self.up
    create_table :requested_domains do |t|
      t.string :domain

      t.timestamps
    end
  end

  def self.down
    drop_table :requested_domains
  end
end
