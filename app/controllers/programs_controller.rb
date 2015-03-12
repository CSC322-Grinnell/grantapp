class ProgramsController < ApplicationController

  private

    def program_params
      params.require(:program).permit(:title, :short_description, :long_description, :deadline, :picture, :tags)
    end
end

