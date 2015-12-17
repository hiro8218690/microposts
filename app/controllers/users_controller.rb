class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "フラッシュmessage"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to @user , notice: 'プロフィールを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end  
  

  private
  
  def authenticate_user!
    if current_user != @user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :description, :location, :email, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end  

end
