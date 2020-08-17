class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  with_options presence: true do
    validates :nickname
    validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :email, uniqueness: true, confirmation: true
    validates :email_confirmation
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, greater_than_or_equal_to: 6, message: 'Include both letters and numbers' }
    validates :birth_day
  end
end
