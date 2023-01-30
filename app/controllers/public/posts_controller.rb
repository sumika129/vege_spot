class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to public_post_path(@post.id)
    else
      render:show
    end
  end

  def index
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @area = @post.area
    @category = @post.category
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:shop, :item, :impression, :image, :area_id, :category_id)
  end
end
