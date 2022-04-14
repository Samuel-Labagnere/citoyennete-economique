class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'Dashboard', :admin_path
end
