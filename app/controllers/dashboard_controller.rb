class DashboardController < ApplicationController
  include SessionsHelper
  before_action :ensure_logged_in

  private

  def ensure_logged_in
    unless is_logged_in
      redirect_to login_path
    end
  end
end
