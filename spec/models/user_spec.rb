require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'taro', email: '', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性があること' do
      user = User.create(email: 'taro@com')
      user = User.new(nickname: 'taro', email: 'taro@com', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'メールアドレスは@を含む必要があること' do
      user = User.new(nickname: 'taro', email: 'aaagmail.com', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '', password_confirmation: '', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは6文字以上であること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345', password_confirmation: '12345', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは半角英数字混合であること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '123456', password_confirmation: '123456', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは確認用を含めて2回入力すること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                   "Password confirmation can't be blank",
                                                   'Password is invalid')
    end

    it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '12345a', family_name: '', first_name: '', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank",
                                                   'First name Full-width characters',
                                                   "Family name can't be blank",
                                                   'Family name Full-width characters')
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '12345a', family_name: 'YAMADA', first_name: 'ﾀﾛｳ', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include('First name Full-width characters', 'Family name Full-width characters')
    end

    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '太郎', family_name_kana: '', first_name_kana: '', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank",
                                                   'First name kana Full-width katakana characters',
                                                   "Family name kana can't be blank",
                                                   'Family name kana Full-width katakana characters')
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '太郎', family_name_kana: 'yamada', first_name_kana: '太郎', birth_day: '19300101')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana Full-width katakana characters',
                                                   'Family name kana Full-width katakana characters')
    end

    it '生年月日が必須であること' do
      user = User.new(nickname: 'taro', email: 'aaa@gmail.com', password: '12345a', password_confirmation: '12345a', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birth_day: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
