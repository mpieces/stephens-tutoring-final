class User < ActiveRecord::Base
  # attr_accessible :first_name, :last_name, :email, :phone, :address, :city
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }, uniqueness: { case_sensitive: false }
#uniqueness inferred by Rails to be true

  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip, presence: true

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
