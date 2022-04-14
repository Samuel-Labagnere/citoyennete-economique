class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @organisation = current_user.organisation
  end
end
