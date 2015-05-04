class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
    	respond_to do |format|
      		if @user.update(user_params)
        		format.html { redirect_to @user, notice: 'User was successfully updated.' }
        		format.json { head :no_content }
      		else
       	 		format.html { render action: 'edit' }
        		format.json { render json: @user.errors, status: :unprocessable_entity }
     		end
    	end
 	end


	private 
		def user_params
			params.require(:user).permit(:name,:email,:school_year,:desired_course,:city,:avatar)
		end

end
