class UsersController < ApplicationController

  before_action :set_user_by_params , only: [:edit, :destroy]
 # before_action :require_same_user, only: [:edit, :update, :destroy, :show]

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to root_path
    else
    end
  end

  def show
    if logged_in?
      @user = User.find(current_user.id)
      @user_contacts =@user.contacts
    else
      render'sessions/new'
    end
  end

  #TODO: Check update User profile
  def edit

  end

  def update
    if @user.update(user_params)
        redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user_by_params
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      redirect_to root_path
    end
  end
end