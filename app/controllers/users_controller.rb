class UsersController < ApplicationController
  
  before_action :authenticate_user!

  cattr_accessor :action_whitelist
  self.action_whitelist = ['index']

  def authenticate_user!
    unless current_user&.is_admin? or action_whitelist.include?(action_name)
      redirect_back(fallback_location: root_path, alert: "You must be admin to access #{action_name}")
    end
  end

  def index
    @users = User.all
  end
  
  def show_in_table
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html { render partial: 'users/show_in_table', locals: { user: @user } }
    end
  end
  
  def edit_in_table
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html { render partial: 'users/edit_in_table', locals: { user: @user } }
    end
  end
  
  def new_in_table
    @user = User.new
    
    respond_to do |format|
      format.html { render partial: 'users/new_in_table', locals: { user: @user } }
    end
  end
  
  def show_in_table_update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { render partial: 'users/show_in_table', locals: { user: @user }, notice: 'User was successfully updated.' }
      else
        format.html { render partial: 'users/edit_in_table', locals: { user: @user }, alert: 'There was an error updating the user.' }
      end
    end
  end
  
  def create
    @user = User.new(user_params)
    @user.password = 'password'

    if @user.save
      flash[:success] = 'User was successfully created.'

    else
      flash[:alert] = 'There was an error creating the user.'
    end

    redirect_to users_path
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