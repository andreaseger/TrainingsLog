class Item < ActiveRecord::Base
  attr_accessible :description, :stroke_id, :tool_id, :distance
  belongs_to :stroke
  belongs_to :tool
  has_many :schedulings
  has_many :schedules, :through => :schedulings
  validates_presence_of :stroke, :distance
  

  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['description like ?', "%#{search}%"],
             :order => 'description'
  end

end

