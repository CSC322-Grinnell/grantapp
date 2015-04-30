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
    #@app.text = "hello"
    @current_user.apps << @program.apps.build(app_params)

    # Parse object/file managment
    application_parse = Parse::Object.new("Applications")
    application_parse["Program_Id"] = flash[:prog].to_s
    application_parse["User_Id"] = @current_user.id.to_s
    ui_file = Tk.getOpenFile
    file = Parse::File.new({
        :body => IO.read(ui_file.to_s),
        :local_filename => "application_id_"+flash[:prog].to_s+"_user_id_"+@current_user.id.to_s+".txt",
        :content_type => "text/plain"
      })
    file.save
    application_parse["File"] = file
    application_parse.save
    files = Parse::Query.new("Applications")
    files = files.eq("Program_Id", '2').get[0]["File"].url
    redirect_to apps_path, notice => 'File successfully uploaded.'
  end

 

   def download
      # STUB
      redirect_to apps_path
    end
end
