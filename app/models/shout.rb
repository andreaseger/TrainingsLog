class Shout < ActiveRecord::Base
  attr_accessible :user_id, :schedule_id, :trained_at
  belongs_to :schedule
  belongs_to :user
  validates_presence_of :trained_at
end
