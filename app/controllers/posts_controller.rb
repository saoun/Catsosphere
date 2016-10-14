class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to "/"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to "/"
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.user == current_user
      @post.destroy
    else
      flash[:alert] = "Only the author of the post can do that!"
    end

    redirect_to "/"
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :image_upload)
  end



end
