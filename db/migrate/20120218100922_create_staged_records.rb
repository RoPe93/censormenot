class CreateStagedRecords < ActiveRecord::Migration
  def self.up
    create_table :staged_records do |t|
      t.string :domain
      t.string :answered_by
      t.string :ip
      t.float :trust

    end
    
    add_index :staged_records, [ :domain, :answered_by ], :unique => :true
  end

  def self.down
    drop_table :staged_records
  end
end
