#
class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, 
																	 :organization, :phone_number, :address, 
																	 :role)
    end
end
