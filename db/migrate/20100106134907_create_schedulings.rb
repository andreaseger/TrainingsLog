class CreateSchedulings < ActiveRecord::Migration
  def self.up
    create_table :schedulings do |t|
      t.integer :schedule_id
      t.integer :item_id
      t.integer :wdh
      t.integer :rank
    end
  add_index :schedulings, [:schedule_id, :rank], :unique => true
  end

  def self.down
    drop_table :schedulings
  end
end

