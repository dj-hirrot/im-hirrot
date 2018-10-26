class InfoMailer < ApplicationMailer
  def user_registration_complete
    @user = params[:user]
    mail(to: ENV["EMAIL_ADDRESS"], subject: '新しいユーザー登録のお知らせ')
  end
end
