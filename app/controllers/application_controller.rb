class ApplicationController < ActionController::Base
    # Devise authentication for all controllers
    before_action :authenticate_user!
  
    private
  
    # Helper method to restrict admin-only access
    def require_admin
      redirect_to root_path, alert: "Access denied." unless current_user&.admin?
    end
  end
  