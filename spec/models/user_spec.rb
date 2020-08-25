require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)# Userのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = nil  # nicknameの値を空にする      
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""  # emailの値を空にする      
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?

      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは@を含む必要があること" do
      @user.email = "emailemail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")  
    end
    it "パスワードは6文字以上であること" do
      @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英数字混合であること(英字)" do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角6文字以上の英数字を含める必要があります")  
    end
    it "パスワードは半角英数字混合であること(日本語)" do
      @user.password = "てすとてすと"
      @user.password_confirmation = "てすとてすと"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角6文字以上の英数字を含める必要があります") 
    end
    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名が、名字と名前がそれぞれ必須であること(名字)" do
      @user.first_name = nil       
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名が、名字と名前がそれぞれ必須であること(名前)" do
      @user.last_name = nil        
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること(カナ名字)" do
      @user.kana_first_name = nil        
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること(カナ名前)" do
      @user.kana_last_name = nil       
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "生年月日が必須であること" do
      @user.birthdate = nil    
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdate can't be blank")
    end
    
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること(名字)" do
      @user.last_name = "hoge"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end    
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること(名前)" do
      @user.first_name = "hoge"   
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end    
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること(カナ名字)" do
      @user.kana_last_name = "かたかな"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name 全角カナ文字を使用してください")
    end
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること(カナ名前)" do
      @user.kana_first_name = "かたかな"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name 全角カナ文字を使用してください")
    end
  end
end



## ユーザー情報
# - ニックネームが必須であること
# - メールアドレスが必須であること
# - メールアドレスが一意性であること
# - メールアドレスは@を含む必要があること
# - パスワードが必須であること
# - パスワードは6文字以上であること
# - パスワードは半角英数字混合であること
# - パスワードは確認用を含めて2回入力すること
# - 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）

##本人情報確認
# - ユーザー本名が、名字と名前がそれぞれ必須であること
# - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# - ユーザー本名のフリガナは全角（カタカナ）で入力させること
# - 生年月日が必須であること