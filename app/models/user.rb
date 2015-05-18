# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string           not null
#  username        :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :password_digest, :session_token, :username, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  attr_reader :password

  has_many :goals

  after_initialize :ensure_session_token

  def self.find_by_credentials(attrs)
    user = User.find_by_username(attrs[:username])
    return user if user && user.is_password?(attrs[:password])
    nil
  end

  def self.generate_token
    SecureRandom::urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_token
    save!
    session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_token
  end
end
