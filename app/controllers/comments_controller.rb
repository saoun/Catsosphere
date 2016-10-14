class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    # @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.create(comment_params)
  #   @comment.user = current_user
  #   @comment.save
  #   redirect_to post_path(@post)
  # end

  def create
    # @post = Post.find(params[:post_id])
      @comment = @commentable.comments.new comment_params
      @comment.user = current_user
      @comment.save
      redirect_to :back

      # if @comment.save

      #   redirect_to post_path(@comment)
      #   #redirect_to :back, notice: 'Your comment was successfully posted!'
      # else
      #   redirect_to post_path(@comment)
      #   #redirect_to :back, notice: "Your comment wasn't posted!"
      # end
    end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end


  private

  # def comment_params
  #   params.require(:comment).permit(:content)
  # end

    def comment_params
      params.require(:comment).permit(:content, :user_id)

    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]

    end
end
