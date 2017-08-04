class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: %(Updated user successfully!)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: %(User deleted successfully!)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :first_name, :last_name, :email)
  end
end
