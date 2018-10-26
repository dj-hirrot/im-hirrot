class Admin::HomeController < Admin::ApplicationController
  def top
  end

  def users
    @users = User.all
    @users = @users.includes(:role).where(roles: { is_confirm: false }) if params[:type] == 'is_not_confirm'
    @users = @users.includes(:role).where(roles: { is_confirm: true }) if params[:type] == 'is_confirm'
    @users = @users.order(created_at: :desc)
  end

  def user_accept
    user = User.find(params[:id])
    role = user.role
    role.is_confirm = true
    if role.save
      InfoMailer.with(user: user).user_confirmed.deliver_now
      redirect_to admin_users_path, notice: "#{user.email}を承認しました"
    else
      redirect_to admin_users_path, alert: "承認に失敗しました"
    end
  end

  def blogs
    @blogs = Blog.all
    @blogs = @blogs.where(is_publish: true) if params[:type] == 'is_publish'
    @blogs = @blogs.where(is_publish: false) if params[:type] == 'is_not_publish'
  end

  def blog_publish
    blog = Blog.find(params[:id])
    notice_txt = ''
    case params[:type]
    when 'be_publish'
      blog.is_publish = true
      blog.published_on = Time.zone.now
      notice_txt = '公開中'
    when 'be_not_publish'
      blog.is_publish = false
      blog.published_on = nil
      notice_txt = '非公開'
    end
    if blog.save
      redirect_to admin_blogs_path, notice: "#{blog.title}を#{notice_txt}にしました"
    else
      redirect_to admin_blogs_path, notice: "#{blog.title}を#{notice_txt}にできませんでした"
    end
  end
end
