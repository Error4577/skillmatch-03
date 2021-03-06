class Engineer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex: { 男性: 0, 女性: 1, その他: 2, 回答しない: 3 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}\z/i.freeze
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze
  VALID_DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/.freeze

  validates :name,
            presence: true,
            length: { maximum: 20 }

  validates :sex,
            presence: true

  validates :birthday,
            presence: true,
            format: { with: VALID_DATE_REGEX }

  validates :self_introduction,
            presence: true,
            length: { maximum: 500 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  validates :password,
            presence: true,
            length: { minimum: 7, maximum: 128 },
            format: { with: VALID_PASSWORD_REGEX }

  validates :phone_number,
            length: { minimum: 10, maximum: 11 },
            format: { with: VALID_PHONE_NUMBER_REGEX },
            unless: :phone_number_presence?

  def phone_number_presence?
    phone_number.nil?
  end
end
