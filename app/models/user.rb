# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  name          :string(255)
#  last_name     :string(255)
#  username      :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  role_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#  customer_id   :integer
#

class User < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :role, inverse_of: :users
  belongs_to :customer, inverse_of: :users

  validates :role, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :password_hash, presence: true, on: :update
  validates :password_salt, presence: true, on: :update
  validates :password, presence: true, on: :create,
                       length: { in: 8..20 }
  validates :password_confirmation, presence: true, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true, scope: :deleted_at }
  validates :username, presence: true, uniqueness: { case_sensitive: true,
                                                     scope: :deleted_at }
  validate :valid_confirmation?, on: :create

  attr_accessor :password
  attr_accessor :password_confirmation

  before_create :encrypt

  def full_name
    "#{name} #{last_name}"
  end

  def admin?
    role.name == 'admin'
  end

  def regular_user?
    role.name == 'regular_user'
  end

  private

  def encrypt
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def valid_confirmation?
    valid = password == password_confirmation
    errors.add(:password_confirmation, 'wrong confirmation') unless valid
    valid
  end
end
