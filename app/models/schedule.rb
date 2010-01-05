class Schedule < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :page, :tag_list
  has_many :comments, :dependent => :destroy
  belongs_to :user
  validates_presence_of :body, :title
  acts_as_taggable_on :tags


  def self.search(search, page)
    paginate :per_page => 5, :page => page,
             :conditions => ['title like ?', "%#{search}%"],
             :order => 'schedules.created_at DESC, schedules.title'
  end

  def self.withtag(tag, page)
    paginate :conditions => ["tags.name=?",tag],
             :joins => "INNER JOIN taggings ON schedules.id = taggings.taggable_id INNER JOIN tags ON taggings.tag_id = tags.id",
             :per_page => 5, :page => page,
             :order => 'schedules.created_at DESC'
  end

#  def self.searchtag2(tag, search, page)
#    paginate :per_page => 10, :page => page,
#             :join => 'tags',
#             :conditions => ['tags like ? and title like ?', "%#{tag}%", "%#{search}%"],
#             :order => 'tags, title'
#  end
end

