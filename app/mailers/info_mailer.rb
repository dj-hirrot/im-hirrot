class InfoMailer < ApplicationMailer
  def user_registration_complete
    @user = params[:user]
    mail(to: ENV["EMAIL_ADDRESS"], subject: '新しいユーザー登録のお知らせ')
  end

  def user_confirmed
    @user = params[:user]
    mail(to: @user.email, subject: '管理者から承認されました')
  end

  def blog_unpined
    mail(to: ENV["EMAIL_ADDRESS"], subject: 'ピンが外されました')
  end

  def recive_blog_comment
    @blog = params[:blog]
    @comment = params[:comment]
    mail(to: ENV["EMAIL_ADDRESS"], subject: 'コメントがつきました')
  end
end
