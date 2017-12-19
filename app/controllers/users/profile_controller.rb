class Users::ProfileController < ApplicationController
    # This is a custom controller with views, it allows the devise user to access it's profile view
    def show
        if user_signed_in? 
            @user = current_user
            render "show"
        end
    end
end
