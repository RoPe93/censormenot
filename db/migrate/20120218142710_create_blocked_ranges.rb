class CreateBlockedRanges < ActiveRecord::Migration
  def change
    create_table :blocked_ranges do |t|
      t.integer :start_ip
      t.integer :end_ip

      t.timestamps
    end
  end
end
