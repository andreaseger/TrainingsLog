class CreateSchedulings < ActiveRecord::Migration
  def self.up
    create_table :schedulings do |t|
      t.integer :collection_id
      t.integer :item_id
      t.integer :wdh, :default => 1
      t.string  :content
    end
  #add_index :schedulings, [:collection_id, :rank], :unique => true
  end

  def self.down
    drop_table :schedulings
  end
end

