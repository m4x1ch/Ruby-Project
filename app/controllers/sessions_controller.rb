class SessionsController < ApplicationController

  def new
  end

  def create

    unless params[:session].blank?

      user = User.find_by(
        email: params[:session][:email].downcase
      )

      if user &&
         user.authenticate(params[:session][:password])

        sign_in user

        redirect_to work_path

      else

        flash.now[:alert] =
          "Неверный email или пароль"

        render "new", status: :unprocessable_entity
      end
    end
  end

  def destroy

    sign_out

    redirect_to root_path
  end

end