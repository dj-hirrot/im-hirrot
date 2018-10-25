# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @role = @user.build_role(auth: 'guest', is_confirm: false)
    logger.debug('-------------------------------------------')
    logger.debug(@role.inspect)
    logger.debug('-------------------------------------------')

    if @user.save && @role.save
      redirect_to root_path, notice: '確認用のメールを送信しました'
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    if @user.destroy
      redirect_to root_path, notice: 'ユーザーの削除に成功しました。'
    else
      redirect_to root_path, alert: 'ユーザーの削除に失敗しました。'
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(params_attributes)
    end

    def params_attributes
      [
        :email, :password, :password_confirm,
        roles_attributes: [
          :auth, :is_confirm
        ]
      ]
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
