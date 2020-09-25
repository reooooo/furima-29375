require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    it "nicknameとemail、passwordとpassword_confirmation、family＿nameとlast_name、family name＿kanaとlast_name_kana、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できない事" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない事" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合は登録できない事" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@が含まれていなければ登録できない事" do
      @user.email = "aaagmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない事" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank" )
    end

    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "１２３４５６"
      @user.password_confirmation = "１２３４５６"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが6文字以上であれば登録できる事" do
      @user.password = "a23456"
      @user.password_confirmation = "a23456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できない事" do
      @user.password = "a2345"
      @user.password_confirmation = "a2345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが存在しなければ登録できない事" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空では登録できない事" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "family_nameが全角入力でなければ登録できない事" do
      @user.family_name = "ｱﾍﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "last_nameが空では登録できない事" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが全角入力でなければ登録できない事" do
      @user.last_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "family_name_kanaが空では登録できない事" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "family_name_kanaが全角カタカナでなければ登録できない" do
      @user.family_name_kana = "ｱﾍﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "last_name_kanaが空では登録できない事" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaが全角カタカナでなければ登録できない" do
      @user.last_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "birthdayが空では登録できない事" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
