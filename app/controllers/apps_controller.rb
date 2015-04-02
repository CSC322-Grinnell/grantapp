class AppsController < InheritedResources::Base

  load_and_authorize_resource
  private

    def app_params
      params.require(:app).permit(:user_id, :program_id, :text)
    end
   
    # def create 
   	#   @user_id = :user_id
   	#   @program_id = :program_id
   	#   @text = :text
    # end
public
    def new
    	debugger
    	@app = @current_user.apps.build
    end

    def create
    	@app.program_id = params[:program].id
    	redirect_to apps_path
    end
end

