require 'rails_helper'
 
RSpec.describe User, type: :model do
  before do
    @user= FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる場合" do
    it "name,email,password,password_confirmation,name,family_name,kana_name,kana_family_name,birthdayが存在すれば登録できる" do
    expect(@user).to be_valid
  end
end

context "新規登録できない場合" do
    it "nicknameが空だと登録できない" do
      @user.nickname= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user= FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "emailに@が含まれていないと登録できない" do
    @user.email='invalid_email.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "passwordが空だと登録できない" do
      @user.password= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password= '12345'
      @user.password_confirmation= '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英数字を含んだ半角6文字以上128文字以下で入力してください")
    end
    it "passwordが129文字以上では登録できない" do
      @user.password= Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation= @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password_confirmation=''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordが英字のみでは登録できない" do   
      @user.password= 'abcdefg'
      @user.password_confirmation= @user.password
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("パスワードは英数字を含んだ半角6文字以上128文字以下で入力してください")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password= '1234567'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("パスワードは英数字を含んだ半角6文字以上128文字以下で入力してください")  
    end
    it "passwordが全角では登録できない" do
      @user.password= "ああああああ"
      @user.password_confirmation= @user.password
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("パスワードは英数字を含んだ半角6文字以上128文字以下で入力してください")
    end
    it "nameが空だと登録できない" do
      @user.name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end
    it "kana_nameが空だと登録できない" do
      @user.kana_name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("カナ名を入力してください")
    end
    it "kana_family_nameが空だと登録できない" do
      @user.kana_family_name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("カナ名字を入力してください")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday=''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
   
    it "kana_nameが全角カタカナでないと登録できない" do
     @user.kana_name= "カタカナ"
     @user.valid?
      expect(@user.errors.full_messages).not_to include("全角カタカナで入力してください")
    end
    it "kana_family_nameが全角カタカナでないと登録できない" do
      @user.kana_family_name= "カタカナ"
      @user.valid?
      expect(@user.errors.full_messages).not_to include("全角カタカナで入力してください")
      end
      it "nameが全角でないと登録できない" do
      @user.name= "全角"
      @user.valid?
      expect(@user.errors.full_messages).not_to include("全角で入力してください")
     end
     it "family_nameが全角でないと登録できない" do
    @user.family_name= "全角"
    @user.valid?
    expect(@user.errors.full_messages).not_to include("全角で入力してください")
     end
  end
 end
end
