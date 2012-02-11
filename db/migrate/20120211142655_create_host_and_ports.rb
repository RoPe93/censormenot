class CreateHostAndPorts < ActiveRecord::Migration
  def self.up
    create_table :host_and_ports do |t|
      t.string :name, :unique

      t.timestamps
    end
  end

  def self.down
    drop_table :host_and_ports
  end
end
