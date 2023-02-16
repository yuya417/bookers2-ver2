# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :sign_in_msg, only: [:create]
  after_action :sign_out_msg, only: [:destroy]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def sign_in_msg
    flash.notice = 'Signed in successfully.'
  end

  def sign_out_msg
    flash.notice = 'Signed out successfully.'
  end
end
