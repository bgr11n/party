module Auth
  class SignUpController < ApplicationController
    def new
      build_sign_up
    end

    def create
      build_sign_up
      save_sign_up || render('new')
    end

  private

    def build_sign_up
      @sign_up ||= Auth::SignUp.new sign_up_params
    end

    def save_sign_up
      redirect_to(sign_up_path, flash: { success:'ssss'}) if @sign_up.save
    end

    def sign_up_params
      params.require(:auth_sign_up).permit(:email, :password) if params[:auth_sign_up]
    end
  end
end
