#
class ProgramsController < InheritedResources::Base
  load_and_authorize_resource

  private

    def program_params
      params.require(:program).permit(:title, :short_description, :long_description, :deadline, :tags, :application_form, :rubric)
    end
    # This is supposed ot send an email to all users 7 days before the program deadline. It is not currently working though.
    def create
      @program = Program.new(program_params)
      
      respond_to do |format|
        if @program.save
          Mailer.reminder_email(@program).deliver_later(wait_until: @program.deadline - 7.days)
        end
      end
    end
end
