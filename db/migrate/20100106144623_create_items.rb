class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :description
      t.integer :stroke_id
      t.integer :tool_id
      t.integer :distance
    end
  #add_index :items, [:stroke_id, :tool_id, :distance], :unique => true
  end

  def self.down
    drop_table :items
  end
end

