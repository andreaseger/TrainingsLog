class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end
  
  def self.down
    drop_table :schedules
  end
end
