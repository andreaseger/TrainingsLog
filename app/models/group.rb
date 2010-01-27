class Group < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :memberships
  has_many :users, :through => :memberships
end
