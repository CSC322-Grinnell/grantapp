class Users::ProfileController < ApplicationController
    
    def show
        if user_signed_in? 
            @user = current_user
            render "show"
        end
    end
end
