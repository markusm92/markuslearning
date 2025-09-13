class ApplicationController < ActionController::Base
    before_action : authenticate_user!
    before_action : require_admin

    def index
        @pages = Page.all 
    end

    def new
        @page = Page.new
    end

    def create
        @page = Page.new(page_params)
        if @page.save
            redirect_to admin_pages_path, notice: "Page created successfully."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @page = Page.find(params[:id])
    end

    def update
        @page = Page.find(params[:id])
        if @page.update(page_params)
            redirect_to admin_pages_path, notice: "Page updated successfully."
        else
            render: edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to admin_pages_path, notice: "Page deleted."
    end

    private

    def page_params
        params.require(:page).permit(:title, :slug, :content, :published)
    end

    def require_admin
        redirect_to root_path, alert: "Access denied." unless current_user&.admin?
    end
end