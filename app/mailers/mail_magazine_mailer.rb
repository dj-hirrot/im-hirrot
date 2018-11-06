class MailMagazineMailer < ApplicationMailer
  def alert_develop_comment
    @user = params[:user]
    mail(to: @user.email, subject: 'コメントができるようになりました')
  end
end
