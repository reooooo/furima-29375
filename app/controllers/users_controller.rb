class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,)
  end

  def move_to_index
    unless user_singin_in?
      redirect_to aaction: :index
    end
end
