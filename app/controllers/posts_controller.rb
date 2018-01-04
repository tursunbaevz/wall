class PostsController < ApplicationController
  def index
  	@posts = Post.all.order('created_at DESC')
  	# @posts.delete_all
  	@post = Post.new
  end


  def new
  	@post = Post.new
  end

  def show 
  	@post = set_post(params[:id])
  end

  def edit
  	@post = set_post(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
	   respond_to do |format|
      		format.html {redirect_to root_path}
      		format.js
    end
  end

  def update
  	@post = set_post(params[:id])

  	@post = set_post(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
  	@post = set_post(params[:id])
  	@post.destroy
  	respond_to do |format|
  	 format.html {redirect_to root_path}
  	 format.js
  	end
  end

  private

	def set_post(post_id)
 	  Post.find(post_id)
	end


    def post_params
  	  params.require(:post).permit(:text)
    end
end
