class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def require_current_user!
    redirect_to :new_session, anchor: '', alert: "Must login!" and return until current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
