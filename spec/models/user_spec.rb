require 'rails_helper'
 
RSpec.describe User, type: :model do
  before do
    @user= FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる場合" do
    it "name,email,password,password_confirmation,name,family_name,kana_name,kana_family_name,bithdayが存在すれば登録できる" do
    expect(@user).to be_valid
  end
end

context "新規登録できない場合" do
    it "nicknameが空だと登録できない" do
      @user.nickname= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user= FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれていないと登録できない" do
    @user.email='invalid_email.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password= '12345'
      @user.password_confirmation= '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが129文字以上では登録できない" do
      @user.password= Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation= @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password_confirmation=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが英字のみでは登録できない" do   
      @user.password= 'abcdefg'
      @user.password_confirmation= @user.password
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password= '1234567'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is invalid")  
    end
    it "passwordが全角では登録できない" do
      @user.password= "ああああああ"
      @user.password_confirmation= @user.password
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "nameが空だと登録できない" do
      @user.name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "kana_nameが空だと登録できない" do
      @user.kana_name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana name can't be blank")
    end
    it "kana_family_nameが空だと登録できない" do
      @user.kana_family_name=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name can't be blank")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   
    it "kana_nameが全角カタカナでないと登録できない" do
     @user.kana_name= "カタカナ"
     @user.valid?
      expect(@user.errors.full_messages).not_to include("Full_width characters")
    end
    it "kana_family_nameが全角カタカナでないと登録できない" do
      @user.kana_family_name= "カタカナ"
      @user.valid?
      expect(@user.errors.full_messages).not_to include("Full_width characters")
      end
      it "nameが全角でないと登録できない" do
      @user.name= "全角"
      @user.valid?
      expect(@user.errors.full_messages).not_to include("Full-width characters")
     end
     it "family_nameが全角でないと登録できない" do
    @user.family_name= "全角"
    @user.valid?
    expect(@user.errors.full_messages).not_to include("Full-width characters")
     end
  end
 end
end
