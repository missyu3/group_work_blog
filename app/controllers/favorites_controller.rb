class FavoritesController < ApplicationController

  def create 
    @favorite = current_user.favorites.new(blog_id: params[:blog_id])
    if @favorite.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def destroy
    favorite = Favorite.find_by(blog_id: params[:id],user_id: current_user.id)
    if favorite.destroy
      redirect_to blogs_path
    else
      render :new
    end
  end

  def index
    user = User.find_by(id: params[:user_id])
    @user = user
  end

end
