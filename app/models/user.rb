class User < ActiveRecord::Base

  attr_accessor :remember_token

  has_secure_password

  YEARS = ["=< 8th Grade", "Freshman", "Sophomore", "Junior", "Senior", "H.S. Grad"]


  before_save { self.email = email.downcase}
  # before_save { |user| user.email = email.downcase }
  # before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
# uniqueness inferred by Rails to be true


  validates :year, inclusion: YEARS
  validates :phone, :address, :city, :zip, presence: true

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # allow_nil gets rid of duplicate error messages / has_secure_password makes sure pw is not nil
  validates :password_confirmation, presence: true

  # Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  # Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

end
