class MailMagazineMailer < ApplicationMailer
  def alert_develop_comment
    @user = params[:user]
    mail(to: @user.email, subject: '新しいユーザー登録のお知らせ')
  end
end
