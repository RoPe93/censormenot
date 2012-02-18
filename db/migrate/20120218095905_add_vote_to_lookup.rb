class AddVoteToLookup < ActiveRecord::Migration
  def self.up
    add_column :lookups, :vote, :string
  end

  def self.down
    remove_column :lookups, :vote
  end
end
