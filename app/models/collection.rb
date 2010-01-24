class Collection < ActiveRecord::Base
  #attr_accessible :wdh, :schedule_id, :content
  has_many :schedulings, :dependent => :destroy
  accepts_nested_attributes_for :schedulings, :reject_if => lambda { |a| a[:item_id].blank? }, :allow_destroy => true
end

