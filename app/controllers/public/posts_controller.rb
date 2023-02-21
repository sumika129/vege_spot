class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to public_post_path(@post.id)
    else
      render:new
    end
  end

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def search
    @posts = Post.search(params[:keyword])
    @posts = @posts.page(params[:page]).per(10)
    @keyword = params[:keyword]
    render "index"
  end

  def area_search
    @posts = Post.area_search(params[:keyword])
    @posts = @posts.page(params[:page]).per(10)
    @keyword = params[:keyword]
    render "index"
  end

  def category_search
    @posts = Post.category_search(params[:keyword])
    @posts = @posts.page(params[:page]).per(10)
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @post = Post.find(params[:id])
    @area = @post.area
    @category = @post.category
    @comment = Comment.new
    #@comment = @post.comment.page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_user_path(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post.id)
    else
      render:edit
    end
  end


  private
  def post_params
    params.require(:post).permit(:shop, :item, :impression, :image, :area_id, :category_id)
  end
end
