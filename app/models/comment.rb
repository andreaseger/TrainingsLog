class Comment < ActiveRecord::Base
  attr_accessible :schedule_id, :body
  belongs_to :schedule
end
