class AppsController < InheritedResources::Base

  private

    def app_params
      params.require(:app).permit(:user_id, :program_id)
    end
end

