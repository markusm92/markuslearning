# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # GET /users/sign_in
  def new
    # This sets @admin_login for the view
    @admin_login = params[:admin] == "true"
    super
  end

  # POST /users/sign_in
  def create
    super do |resource|
      # Redirect admins to admin dashboard
      if resource.admin?
        return redirect_to admin_root_path
      end
    end
  end
end
