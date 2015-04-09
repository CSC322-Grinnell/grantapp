#
class AppsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def app_params
      params.require(:app).permit(:user_id, :program_id, :text)
    end

  public

    def new
      p_id = params[:program_id].to_i
      flash[:prog] = p_id
    end

    def create
    @program = Program.find_by_id(flash[:prog])
    @app.user_id = @current_user.id
    @app.program_id = flash[:prog]
    @current_user.apps << @program.apps.build(app_params)
    redirect_to apps_path
  end
end
