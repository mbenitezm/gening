class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?, :current_customer

  layout :choose_layout

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_customer
    @current_customer ||= current_user.customer
  end

  def user_signed_in?
    return true if session[:user_id]
    false
  end

  private

  def choose_layout
    return 'not_logged' unless user_signed_in?
    session[:role]
  end
end
