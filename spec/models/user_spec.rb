require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  
    it 'メールアドレスが一意性があること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = "aaagmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは6文字以上であること' do
      @user.password = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは半角英数字混合であること' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
      @user.first_name = nil
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "Family name can't be blank")
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.first_name = "taro"
      @user.family_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters', 'Family name Full-width characters')
    end

    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
      @user.first_name_kana = nil
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "Family name kana can't be blank")
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      @user.first_name_kana = "ﾀﾛｳ"
      @user.family_name_kana = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters', 'Family name kana Full-width katakana characters')
    end

    it '生年月日が必須であること' do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
