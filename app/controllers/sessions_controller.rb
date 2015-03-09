class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
