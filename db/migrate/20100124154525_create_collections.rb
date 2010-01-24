class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.integer :wdh  , :default => 1
      t.integer :schedule_id
      t.string  :content
    end
  end

  def self.down
    drop_table :collections
  end
end

