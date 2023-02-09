class Admin::CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end
end
