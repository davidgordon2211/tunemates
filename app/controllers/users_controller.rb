class UsersController < ApplicationController
  before_action :find_user, only: [:home, :show, :edit, :destroy, :update]
  def show
  end

  def edit
  end

  def update
    @user = current_user
    @user.update(user_params)
    if user.save
      redirect to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo, :color)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
