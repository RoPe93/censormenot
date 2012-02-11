class CreateLookups < ActiveRecord::Migration
  def self.up
    create_table :lookups do |t|
      t.string :domain
      t.string :ip
      t.float :trust

      t.timestamps
    end

    add_index :lookups, :domain
  end

  def self.down
    drop_table :lookups
  end
end
