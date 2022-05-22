class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
with_options presence: true do
  validates :nickname
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :birthday
end
validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, allow_blank: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, allow_blank: true
  validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, confirmation: true, allow_blank: true
end
