class UsersController < ApplicationController

	def show
		 @user = User.find(params[:id])
	end
end
# separate from user in devise where controller/model things are built into the gem
