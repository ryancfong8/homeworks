class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credential(params[:user][:username], params[:user][:password])
    if @user
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
