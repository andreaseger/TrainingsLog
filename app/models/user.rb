class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :group_ids, :openid_identifier, :login_count
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end

  has_many :schedules
  has_many :comments
  has_many :memberships
  has_many :groups, :through => :memberships

  validates_presence_of :username, :email#, :password, :password_confirmation

  def role_symbols
    groups.map do |group|
      group.name.underscore.to_sym
    end
  end

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end


end

