#
class ProgramsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def program_params
      params.require(:program).permit(:title, :short_description, :long_description, :deadline, :tags, :application_form, :rubric)
    end
    
    public
    
    def view
      @program = Program.find(params[:id])
    end

    def new
      @program = params[:program_id]
    end
    
    def edit
      @program = Program.find(params[:id])
    end
  
    def update
      @program = Program.find(params[:id])
    end
end
