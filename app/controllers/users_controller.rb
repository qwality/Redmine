class UsersController < ApplicationController
  
  before_action :authenticate_user!

  cattr_accessor :action_whitelist
  self.action_whitelist = ['index']

  def authenticate_user!
    unless current_user&.is_admin? or action_whitelist.include?(action_name)
      redirect_to root_path, alert: "You must be admin to access #{action_name}"
    end
  end

  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    @user.password = 'password'

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      # puts @user.errors.full_messages
      redirect_to root_path, alert: 'There was an error creating the user.'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      redirect_to root_path, alert: 'There was an error updating the user.'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroyed?
      redirect_to root_path, notice: 'User was successfully deleted.'
    else
      redirect_to root_path, alert: 'There was an error deleting the user.'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :address)
    end
end