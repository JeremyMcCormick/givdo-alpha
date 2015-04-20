class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show    
    @post = Post.find_by_id(params['id'])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    Rails.logger.debug params.inspect
    @post = Post.create(post_params)
    @post['date'] = Time.now
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
    @post = Post.find_by_id(params[:id])
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to posts_path
  end
  
  def embed_url(url)
    url.sub! 'www.youtube.com/watch?v=', 'www.youtube.com/embed/'
    url
  end
  
  helper_method :embed_url
  
  private
  
  def post_params
    params.require(:post).permit(:title, :message, :video_url, :organization_id)
    # :date
  end
  
end