class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :group_ids, :openid_identifier
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end

  has_many :schedules
  has_many :comments
  has_many :memberships
  has_many :groups, :through => :memberships

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