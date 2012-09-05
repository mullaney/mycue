class UsersController < ApplicationController

	def show
    if logged_in?
      @user = User.find(params[:id])
      if current_user?(@user)
        @scripts = @user.scripts
      else
        flash[:notice] = "You do not have permission to see other profiles."
        redirect_to current_user
      end
    else
      flash[:notice] = "Please sign in first."
      redirect_to login_path
    end
	end
	
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      login @user
      flash[:success] = "Thanks for joining myCue!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

end
