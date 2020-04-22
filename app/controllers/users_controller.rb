class UsersController < ApplicationController
  skip_before_action :login_required

  def new 
    @user = User.new
  end

  def show 
    @user = User.all.find_by(id: params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id
      redirect_to blogs_path
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
