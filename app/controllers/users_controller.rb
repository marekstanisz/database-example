class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if user_signed_in? && current_user == @user
      redirect_to users_path, alert: 'You can\'t remove yourself!'
    else
      @user.destroy
      redirect_to users_path, notice: 'User has been destroyed'
    end
  end
end
