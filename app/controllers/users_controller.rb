class UsersController < ApplicationController
    def update
      @user = User.find(params[:id])
  
      if @user.update(user_params)
        redirect_to root_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
  
      if @user.destroyed?
        redirect_to root_path, notice: 'User was successfully deleted.'
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :address)
    end
  end