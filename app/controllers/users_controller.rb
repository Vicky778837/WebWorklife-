class UsersController < ApplicationController
	  before_action :logged_in_user, only: [:show]
def index
  @users  = User.all
  @users = User.paginate(:page => params[:page], :per_page => 3)

end
 def show
    @user = User.paginate(:page => params[:page], :per_page => 3)

    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "Your profile has been sing up."
     redirect_to "/"
    else
      render 'new'
    end
  end


  def destroy
    @user = User.find(params[:id])
    if logged_in? && current_user.articles.exists?
        @user.destroy
        flash[:notice] = "users was successfully destroyed."
        redirect_to "/"
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:avatar)
  end
end
