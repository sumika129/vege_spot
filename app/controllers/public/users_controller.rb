class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post =current_user.posts
  end

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_post = Post.find(likes)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(current_user)
    else
      render:edit
    end
  end

  def unsubscribe
    @user = User.find_by(email: params[:email])
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
