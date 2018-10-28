class BlogsController < ApplicationController
  before_action :authenticate_user!, only: []
  before_action :user_confirmed?, except: [:index, :show]
  before_action :is_admin?, except: [:index, :show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    blogs = Blog.where.not(is_pin: true)
    @pined_blog = Blog.find_by(is_pin: true)
    if current_user.try(:admin?)
      @blogs = blogs.order(published_on: :desc)
    else
      @blogs = blogs.where(is_publish: true).order(published_on: :desc)
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    if params[:preview] || !@blog.save
      render :new
    else
      redirect_to @blog, notice: '記事の作成に成功しました'
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    @blog.attributes = blog_params

    if params[:preview] || !@blog.update(blog_params)
      render :edit
    else
      redirect_to @blog, notice: 'ブログの更新に成功しました'
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'ブログを削除しました'
  end

  private
    def set_pin
      return if params[:blog][:is_pin] == '0'
      Blog.update_all(is_pin: false)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content, :public, :published_on, :tag_list, :is_pin)
    end
end
