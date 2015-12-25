class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
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


  #http://railstutorial.jp/chapters/following_users?version=4.2#code-following_followers_actions 参照
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
  end

  private
  
  def authenticate_user!
    if current_user != @user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :description, :location, :email, :password,
                                 :password_confirmation, :followers, :following)
  end
  
  def set_user
    @user = User.find(params[:id])
  end  

end
