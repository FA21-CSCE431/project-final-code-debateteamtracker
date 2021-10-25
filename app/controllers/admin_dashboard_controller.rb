class AdminDashboardController < ApplicationController
    before_action :authenticate_admin!
    before_action :authenticate_permission
  
    def authenticate_permission
      redirect_to '/', alert: 'Not authorized. This email does not have admin permissions' unless Member.exists?(['email LIKE ? AND priority = 3', "%#{current_admin.email}"])
    end

    def overview
    end
end