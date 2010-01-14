class CreateTools < ActiveRecord::Migration
  def self.up
    create_table :tools do |t|
      t.string :name
    end
  end

  add_index :tools, :name, :unique => true
  def self.down
    drop_table :tools
  end
end

