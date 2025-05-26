class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, allow_nil: true

  normalizes :email, with: ->(email) { email.downcase.strip }

  has_many :grocery_lists, dependent: :destroy
end
