class Scheduling < ActiveRecord::Base
  #attr_accessible :schedule_id, :item_id, :wdh, :rank
  belongs_to :collection
  belongs_to :item
end

