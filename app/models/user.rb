class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :name
  validates_uniqueness_of :email
  has_many :user_emotions
  has_many :emotions, through: :user_emotions
  belongs_to :country

end
