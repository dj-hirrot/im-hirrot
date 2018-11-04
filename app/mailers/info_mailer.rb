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
    @user = User.joins(:role).where(roles: { auth: 'admin' }).first
    mail(to: @user.email, subject: 'ピンが外されました')
  end
end
