class UsersController < ApplicationController
  
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    if signed_in?
      redirect_to root_path
    end
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
    if signed_in?
      redirect_to root_path
    else 
      @user = User.new(params[:user])
      if (@user.save)
        flash[:success] = "Welcome to the Sample App!"
        sign_in @user
        redirect_to @user
      else
        render 'new'
      end
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
<<<<<<< HEAD
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def edit
  end
  
=======
  def edit
  end

>>>>>>> user-microposts
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_url
  end
  
  private
<<<<<<< HEAD
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
=======
>>>>>>> user-microposts
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
<<<<<<< HEAD
=======
      if current_user.admin?
        redirect_to(root_path) unless current_user?(@user)
      end
>>>>>>> user-microposts
    end
end
