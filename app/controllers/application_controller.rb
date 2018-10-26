class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def is_admin?
    if signed_in? && !current_user.admin?
      redirect_to root_path, alert: '一般ユーザーには閲覧が制限されています'
    end
  end

  def user_confirmed?
    if signed_in? && current_user.role.is_confirm == false
      redirect_to user_registration_path, alert: '未承認の為閲覧が制限されています'
    end
  end
end
