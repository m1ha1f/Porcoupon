class UsersController < ApplicationController
  before_filter :correct_user, :only => [:show]

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

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

   private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(signin_path) unless current_user?(@user)
    end

end
