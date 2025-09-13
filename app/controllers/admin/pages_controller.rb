class Admin::PagesController < ApplicationController
  before_action :require_admin          # Rajataan pääsy vain admineille näin aluksi.
  before_action :set_page, only: [:edit, :update, :destroy]

  # GET /admin/pages
  def index
    @pages = Page.all
  end

  # GET /admin/pages/new
  def new
    @page = Page.new
  end

  # POST /admin/pages
  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path, notice: "Page created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/pages/:id/edit
  def edit; end

  # PATCH/PUT /admin/pages/:id
  def update
    if @page.update(page_params)
      redirect_to admin_pages_path, notice: "Page updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/pages/:id
  def destroy
    @page.destroy
    redirect_to admin_pages_path, notice: "Page deleted."
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :content, :published)
  end
end
