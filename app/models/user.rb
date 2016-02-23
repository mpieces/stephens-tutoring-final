class User < ActiveRecord::Base
  # attr_accessible :first_name, :last_name, :email, :phone, :address, :city
  has_secure_password

  YEARS = ["=< 8th Grade", "Freshman", "Sophomore", "Junior", "Senior", "H.S. Grad"]

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }, uniqueness: { case_sensitive: false }
#uniqueness inferred by Rails to be true

  validates :year, inclusion: YEARS
  validates :phone, :address, :city, :zip, presence: true

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
