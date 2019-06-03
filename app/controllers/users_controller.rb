class UsersController < ApplicationController
  before_action :find_user, only: [:home, :show, :edit, :destroy]
  def show
  end

  def edit
  end


  # def home
  #   @user = current_user
  #   authorize @user
  # end

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
    # redirect to homepage
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo, :color)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
