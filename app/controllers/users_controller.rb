class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:create, :new]
  before_filter :check_if_admin, :only => [:index]

  def index
      @users = User.all
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new params[:user]
      if @user.save
          session[:user_id] = @user.id
          redirect_to new_task_path
      else
          render :new
      end
  end

  def show
    # binding.pry
    @user = User.find @current_user.id
  end

  def update
    @user = @current_user
    user_info = params[:user]
    @user.image = user_info[:image]
    @user.about = user_info[:about]
    @user.email = user_info[:email]
    @user.location = user_info[:location]
    if (@user.save)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit
    @user = User.find @current_user.id
  end


  private
  def check_if_logged_in
      redirect_to(root_path) if @current_user.nil?
  end

  def check_if_admin
      redirect_to(root_path) if @current_user.nil? || @current_user.admin == false
  end
end
