class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :roles, :roles_mask, :openid_identifier, :login_count
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end

  has_many :schedules
  has_many :comments
  #has_many :memberships
  #has_many :groups, :through => :memberships

  validates_presence_of :username, :email#, :password, :password_confirmation
  
  named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  ROLES = %w[admin registered_user moderator author]
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  
  def role_symbols
  	roles.map(&:to_sym)
  end
#  def role_symbols
#    groups.map do |group|
#      group.name.underscore.to_sym
#    end
#  end

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end


end

