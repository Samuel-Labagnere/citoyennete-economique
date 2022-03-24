class AdminController < ApplicationController
  before_action :check_super_admin

  def index
  end

  private

    def check_super_admin
      if !current_user || !current_user.is_super_admin
        render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
      end
    end
end
