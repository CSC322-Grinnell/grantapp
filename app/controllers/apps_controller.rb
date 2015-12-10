#
class AppsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def app_params
      params.require(:app).permit(:user_id, :program_id, :text, :user_app)
    end

  public
  
    def create
      @app = App.new(app_params)
      if @app.save
        redirect_to app_path(@app)
      else
        redirect_to new_app_path(:program_id => params[:app][:program_id]), alert: "You have uploaded an invalid file type. Only .PDF and .DOC are allowed. Try again."
      end
    end

    def new
      @program = params[:program_id]
      @user = @current_user
    end
    
    def edit
      @app = App.find(params[:id])
      @program = @app.program_id
      @user = @current_user
    end
  
    def update
      @app = App.find(params[:id])
      if @app.update_attributes(app_params)
        redirect_to app_path(@app)
      else
        redirect_to edit_app_path, alert: "You have uploaded an invalid file type. Only .PDF and .DOC are allowed. Try again."
      end
    end

    def download
      redirect_to apps_path
    end
    
end
