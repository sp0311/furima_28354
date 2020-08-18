class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  with_options presence: true do
    validates :nickname
    validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*).*[!@#$%]+.*/ }
    validates :password_confirmation
    validates :birth_day
  end
end

