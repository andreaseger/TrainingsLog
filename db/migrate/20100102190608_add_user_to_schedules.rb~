class AddUserToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :user_id, :integer
    add_column :comments, :user_id, :integer
  end

  def self.down
    remove_column :schedules, :user_id
    remove_column :comments, :user_id
  end
end
