class Admin::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :is_admin?
end
