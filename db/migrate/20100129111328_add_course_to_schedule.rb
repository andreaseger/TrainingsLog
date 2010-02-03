class AddCourseToSchedule < ActiveRecord::Migration
  def self.up
    add_column :schedules, :course, :integer
  end

  def self.down
    remove_column :schedules, :course
  end
end
