class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
    end
  end

  add_index :groups, :name, :unique => true
  def self.down
    drop_table :groups
  end
end

