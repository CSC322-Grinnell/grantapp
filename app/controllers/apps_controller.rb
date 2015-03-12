class AppsController < InheritedResources::Base
load_and_authorize_resource
  private

    def app_params
      params.require(:app).permit(:user_id, :program_id)
    end
end

