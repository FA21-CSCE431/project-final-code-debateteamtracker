class ProfileController < ApplicationController
    before_action :authenticate_permission

    def authenticate_permission
      if !current_admin.present?
        redirect_to '/', alert: 'If you are a member, sign in to view your profile'
      elsif Member.exists?(['email LIKE ? AND priority = 3', "%#{current_admin.email}"])
        redirect_to '/admin_dashboard/overview'
      end
    end

    def index
        if Member.exists?(['email LIKE ? AND priority = 1', "%#{current_admin.email}"])
            @member = Member.where(:email => current_admin.email).first
        else
            redirect_to '/', alert: 'If you are a member, sign in to view your profile'
        end
        @entries = []
        unless current_admin.nil?
          if Member.exists?(['email LIKE ? AND priority = 1', "%#{current_admin.email}"])
            @current = Member.where(:email => current_admin.email).first
    
            @participation = Participation.where(member_id: @current.id)
            @events = PointsEvent.all
        
        
        
            @participation.each do |p|
              @entries << @events.find(p.points_event_id)
            end
          end
        end
    end

    def user
        @member = Member.where(:email => current_admin.email).limit(1)
    end


end