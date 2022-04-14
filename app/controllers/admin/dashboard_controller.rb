class Admin::DashboardController < Admin::ApplicationController
  def index
    @organisation = current_user.organisation
  end
end
