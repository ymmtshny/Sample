class UsersController < ApplicationController
  def new
    #先ほど作ったUserモデルの新しいインスタンスを変数に代入する
    @user = User.new
  end
  
  def show 
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
