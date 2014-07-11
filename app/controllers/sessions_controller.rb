class SessionsController < ApplicationController
  def new
    #@user = User.new
  end

  def create 
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to root_path
    else
      render :new
    end
  #  cookies.signed[:user_id] = user.id
  #  redirect_to galleries_path
  end

  def destroy
    sign_out
    redirect_to galleries_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
