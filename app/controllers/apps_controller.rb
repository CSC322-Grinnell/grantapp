#
class AppsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def app_params
      params.require(:app).permit(:user_id, :program_id, :text, :user_app)
    end

  public

    def new
      @program = params[:program_id]
      @user = @current_user
    end
    
    def edit
      @program = @app.program.id
      @user = @app.user.id
    end

    def download
      redirect_to apps_path
    end
    
end
