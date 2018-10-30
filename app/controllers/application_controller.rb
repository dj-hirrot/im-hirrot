class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :create_track_viewer

  def is_admin?
    if current_user.nil? || !current_user.admin?
      redirect_to blogs_path, alert: '一般ユーザーには閲覧が制限されています'
    end
  end

  def user_confirmed?
    if signed_in? && current_user.role.is_confirm == false
      redirect_to blogs_path, alert: '未承認の為閲覧が制限されています'
    end
  end

  def create_track_viewer
    if current_user.present? && !current_user.admin?
      log = current_user.track_viewers.build(landing_on: request.fullpath, landing_at: Time.zone.now)
      log.save
    end
  end
end
