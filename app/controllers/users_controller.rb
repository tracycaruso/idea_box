class UsersController < ApplicationController

  def index
  end

  def new
    #goes to new.html.erb to be used in create form
    @user = User.new
  end

  def show
    #used in sessions to show individual user
    #used in create to render individual user
    @user = User.find(params[:id])
  end

  def create
    # gets user info and creates new user
    # saves if valid else redirects
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
