class Collection < ActiveRecord::Base
  #attr_accessible :wdh, :schedule_id, :content
  belongs_to :schedule
  has_many :schedulings, :dependent => :destroy
  validates_presence_of :wdh#, :schedulings
  accepts_nested_attributes_for :schedulings, :allow_destroy => true
end

