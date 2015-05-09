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
      # Parse object/file managment
      application_parse = Parse::Object.new("Applications")
      application_parse['Program_Id'] = flash[:prog].to_s
      application_parse['User_Id'] = @current_user.id.to_s
      ui_file = 'WorldBankApp.txt'#Tk.getOpenFile
      file = Parse::File.new({
        :body => IO.read(ui_file.to_s),
        :local_filename => 'program_id_' + flash[:prog].to_s + '_user_id_' + @current_user.id.to_s +'.txt',
        :content_type => 'text/plain'
                             })
      file.save
      application_parse['File'] = file
      application_parse.save
      redirect_to apps_path, notice => 'File successfully uploaded.'
    end

    def download
      # Make a query to Parse to retreive the relevant application
      file_query = Parse::Query.new('Applications')
      file_query.eq('Program_Id', @app.program_id.to_s)
      file_query.eq('User_Id', @app.user_id.to_s)
      file = file_query.get
      redirect_to file.last['File'].url
    end
end
