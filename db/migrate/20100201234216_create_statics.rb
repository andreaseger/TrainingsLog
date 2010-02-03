class CreateStatics < ActiveRecord::Migration
  def self.up
    create_table :statics do |t|
      t.string :name
      t.string :permalink
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :statics
  end
end
