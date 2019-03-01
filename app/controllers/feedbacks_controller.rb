class FeedbacksController < InheritedResources::Base
  load_and_authorize_resource
  
  private

    def feedback_params
      params.require(:feedback).permit(:user_id, :app_id, :comment, :score)
    end
    
  public
  
    def new
       # @app = params[:app_id]
      @app = params.permit(:user_id, :app_id, :comment, :score) #removed .require(:feedback) as it was blocking the ability to do feebacks. 
      @user = @current_user
    end
    
    def edit
      @app = @feedback.app.id
      @user = @feedback.user
    end
end

