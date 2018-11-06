class CommentsController < ApplicationController
  before_action :authenticate_user!, only: []
  before_action :set_blog
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @blog.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @blog, notice: 'コメントを追加しました'
    else
      redirect_to @blog, alert: 'コメントの追加に失敗しました'
    end
  end

  def destroy
    @comment.destroy
    redirect_to blog_path(@blog), notice: 'コメントを削除しました'
  end

  private
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:blog_id, :author, :content)
    end
end
