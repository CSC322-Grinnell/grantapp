class ApplicationsController < ApplicationController

  private

    def application_params
      params.require(:application).permit(:user_id, :program_id)
    end
end

