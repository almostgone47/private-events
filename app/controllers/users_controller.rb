class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "You've successfully signed up!"
      login(@user)
  		redirect_to user_path(@user)
  	else
  		flash[:danger] = "Your signup was unsuccessful. Please try again."
  		redirect_to root_path
  	end
  end

  def show
  	@user = User.find(params[:id])
    @events = Event.where(creator_id: current_user.id)
  end

  private

  	def user_params
  		params.require(:user).permit(:username)
  	end
end
