class Public::LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(@post.id)
    like.save
    redirect_to public_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(@post.id)
    @like.destroy
    redirect_to public_post_path(params[:post_id])
  end

end
