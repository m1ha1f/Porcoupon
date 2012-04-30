class UsersController < ApplicationController

  def new
  	@title = "Sign up"
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      render 'new'
    end
  end

end
