class UsersController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
  @user = User.find(params[:id])
  @posts = @user.posts
  end

  def new
   @user = User.new
 end

 def create
   @user = User.new(user_params)
   @user.email.downcase!

   if @user.save
     flash[:notice] = "Account created successfully!"
     redirect_to root_path
   else
     flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
     render :new
   end
 end


private

 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end

end
