namespace :mail do
  desc 'コメント機能実装のアラートを全ユーザへ送る。'
  task alert_develop_comment: :environment do
    User.all.each do |user|
      MailMagazineMailer.with(user: user).alert_develop_comment.deliver_now
      puts '------------------------------------------'
      puts "#{user.email} 送信完了"
    end
  end
end
