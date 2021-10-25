class ProfileController < ApplicationController
    before_action :authenticate_admin!
    before_action :authenticate_permission

    def authenticate_permission
      if Member.exists?(['email LIKE ? AND priority = 3', "%#{current_admin.email}"])
        redirect_to '/admin_dashboard/overview'
      end
    end

    def index
        if Member.exists?(['email LIKE ? AND priority = 1', "%#{current_admin.email}"])
            @member = Member.where(:email => current_admin.email).first
        else
            redirect_to '/', alert: 'If you are a member, sign in to view your profile'
        end
    end
    def user
        @member = Member.where(:email => current_admin.email).limit(1)
    end


end