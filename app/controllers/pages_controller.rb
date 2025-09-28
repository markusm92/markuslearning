class PagesController < ApplicationController
  # GET /pages
  def index
    # Fetch only published pages for users
    @pages = Page.where(published: true).order(created_at: :desc)
  end

  # GET /pages/:id
  def show
    @page = Page.find_by(id: params[:id])
  end
end
