class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}\z/i
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  validates :name,
            presence: true,
            length: { maximum: 50 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  validates :password,
            presence: true,
            length: { minimum: 7, maximum: 128 },
            format: { with: VALID_PASSWORD_REGEX }

  validates :phone_number,
            presence: true,
            length: { minimum: 10, maximum: 11 },
            format: { with: VALID_PHONE_NUMBER_REGEX }
end
