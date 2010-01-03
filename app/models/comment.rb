class Comment < ActiveRecord::Base
  attr_accessible :schedule_id, :body, :user_id
  belongs_to :schedule
  belongs_to :user
end
