#
class ProgramsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def program_params
      params.require(:program).permit(:title, :short_description, :long_description, :deadline, :tags, :application_form, :rubric)
    end
end
