class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :is_admin?

  def is_admin?
    signed_in? ? current_user.admin : false
  end

  protected

  def check_access!
    redirect_to root_path, alert: 'Access denied' unless is_admin?
  end
end
