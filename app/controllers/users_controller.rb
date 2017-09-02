class UsersController < ApplicationController
  skip_before_action :authenticate_user,only: [:login, :authenticate , :new, :create]
  def index
  	@user = User.all
  end

  def new
  	@user = User.new
    @user.build_image
  end
  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:notice] = "Successfully saved the records !"
    	redirect_to users_path
    else
    	flash[:notice] = "Oops something went wrong !"
        render :new
  end
  end
# def login
#  @user= User.new
# end
  def authenticate
   @user= User.db_authenticate(user_params)
  if @user
    session[:user_id] = @user.id
    flash[:notice] = "Logged in!"
    redirect_to users_path
  else
    flash[:notice] = "User or Password do not match"
    render :login
  end
  end
  def edit
  	@user = User.find params[:id]
  end
  def update
  	@user = User.find params[:id]
  	if @user.update(user_params)
  		flash[:notice] = "Sucessfully updated record"
  		redirect_to users_path
  	else
  		flash[:notice] = "Oops something went wrong!"
  		render :edit
  end
  end
  def show
  	@user = User.find params[:id]
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
  def destroy
  @user = User.find params[:id]
  @user.destroy
  flash[:notice] = "Successfully Deleted"
  redirect_to users_path
  end
  private
  def user_params
  	params.require(:user).permit!
  end
end
