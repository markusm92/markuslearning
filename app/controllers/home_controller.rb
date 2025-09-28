# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!  # Vain sisäänkirjautuneet pitäs nähdä homepage.
  def index
    # Fetch only published pages for users
    @pages = Page.where(published: true).order(:title)
  end
end
