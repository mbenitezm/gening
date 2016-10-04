class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all.includes(:role)
  end

  def create
    @user = User.new(object_params)
    if @user.save
      flash[:success] = 'User created successfully.'
      redirect_to users_path
    else
      flash[:error] = 'User not created.'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'User deleted successfully.'
      redirect_to users_path
    else
      flash[:error] = 'User not deleted.'
      render :new
    end
  end

  private

  def object_params
    params.require(:user).permit(:email, :name, :last_name, :username,
                                 :password, :password_confirmation, :role_id,
                                 :company_id)
  end
end
