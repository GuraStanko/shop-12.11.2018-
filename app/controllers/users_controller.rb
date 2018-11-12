class UsersController < ApplicationController

#before_action :confirm_logged_in   
respond_to :html, :js

def index
 @users = User.all.sorted
end

def show
 @user = User.find(params[:id])
end

def new
 @user = User.new
end

def create
 @user = User.new(user_params)
 respond_to do |format|
  format.html { redirect_back }
  format.js
 end
 if @user.save
  flash[:success] = 'Welcome, #{@user.first_name}!'
 else
  render('new')
 end
end

def edit
 @user = User.find(params[:id])
end

def update
 @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = 'You have been updated.'
    redirect_to(:action => 'show')
  else
    render('edit')
  end
end

def delete
 @user = User.find(params[:id])
end

def destroy
 @user = User.find(params[:id]).destroy
 flash[:notice] = '#{@user.first_name} #{@user.last_name} has been deleted.'
 redirect_to ('home')
end

private

def user_params
 params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password, :avatar)
end

end