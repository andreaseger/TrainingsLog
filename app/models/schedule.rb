class Schedule < ActiveRecord::Base
  attr_accessible :title, :body
  validates_presence_of :body, :title
  has_many :comments
end
