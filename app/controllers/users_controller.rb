class UsersController < ApplicationController


  def create
    @user= User.new(user_params)
    if @user.save
      # 保存に成功した場合の処理
      redirect_to root_path 
    else
      # 保存に失敗した場合の処
      render :new     
      # render :error
    end
  end



  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, :name, :kana_family_name, :kana_name, :birthday)
  end
end
