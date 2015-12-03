class FeedbacksController < InheritedResources::Base
  load_and_authorize_resource
  
  private

    def feedback_params
      params.require(:feedback).permit(:user_id, :app_id, :comment, :score)
    end
    
  public
  
    def new
      @app = params[:app_id]
      @user = @current_user
    end
    
    def edit
      @app = @feedback.app.id
      @user = @feedback.user
    end
end

