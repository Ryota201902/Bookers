class PostsController < ApplicationController
  def top
  end

  def index
  	@post = Post.new
  	@posts = Post.all
  end

  def create
  	post = Post.new(post_params)
  	if post.save
  		flash[:notice] = "Book was successfully created"
  		redirect_to post_path(post)
  	else
  		render post_path(post)
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to post_path(post)
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path(post)
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
