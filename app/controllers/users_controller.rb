# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  name          :string(255)
#  last_name     :string(255)
#  username      :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  role_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#  company_id    :integer
#

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
