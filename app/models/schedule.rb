class Schedule < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  validates_presence_of :body, :title
  has_many :comments, :dependent => :destroy
  belongs_to :user
end
