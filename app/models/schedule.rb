class Schedule < ActiveRecord::Base
  #attr_accessible :title, :body, :user_id, :page, :tag_list, :item_ids
  has_many :comments, :dependent => :destroy
  has_many :collections, :dependent => :destroy
  accepts_nested_attributes_for :collections, :reject_if => lambda { |a| a[:wdh].blank? }, :allow_destroy => true

  has_many :schedulings, :through => :collections
  has_many :items, :through => :schedulings

  belongs_to :user
  validates_presence_of :body, :title
  acts_as_taggable_on :tags


  def self.search(search, page)
    paginate :per_page => 5, :page => page,
             :conditions => ['title like ? or body like ?', "%#{search}%", "%#{search}%"],
             :order => 'schedules.created_at DESC, schedules.title'
  end

  def self.withtag(tag, page)
    paginate :conditions => ["tags.name=?",tag],
             :joins => "INNER JOIN taggings ON schedules.id = taggings.taggable_id INNER JOIN tags ON taggings.tag_id = tags.id",
             :per_page => 5, :page => page,
             :order => 'schedules.created_at DESC'
  end
end

