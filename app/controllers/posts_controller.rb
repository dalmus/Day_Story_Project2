class PostsController < ApplicationController
  before_action :authorize, only: [:index, :new, :show]
  before_action :post_owner, only: [:destroy, :edit, :update]
  def secret
  end

  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path(current_user) if current_user != @post.user
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to :posts
    else
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to :post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
def post_params
  params.require(:post).permit(:title, :content)
end

def post_owner
  @post = Post.find(params[:id])
  unless current_user.id == @post.user_id
    flash[:notice] = "You Shall not pass!"
    redirect_to @post
  end
end

end
