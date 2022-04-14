class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    add_breadcrumb 'Dashboard', :user_root_path
    @organisation = current_user.organisation
  end
end
