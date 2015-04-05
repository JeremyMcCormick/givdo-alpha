class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show    
    @post = Post.find(params['id'])    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    #@post['date'] = Time.now
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :message, :video_url, :organization)
      # :date
    end
  
  # This is a mock-up post that can be used to render the post partial.
  def mockup
    @post = Post.new
    @post['date'] = Time.now
    @post['title'] = 'Homeless Dog Gets a Makeover that Saves his Life!'
    @post['message'] =
    '<p>Charlie the Shelter Dog was found on the side of the road and brought to an L.A. Area Shelter. 
    He was covered in painful burrs. Charlie needed to be adopted quick because the facility was a high kill shelter.</p>
    <p>The Transformation saved his life. After his makeover, he was adopted. 
    There are thousands of other dogs in shelters just like Charlie. Share this video to make a difference.</p>'
    @post['video_url'] = 'https://www.youtube.com/embed/h4xwkl4EQJ4'
    @post['organization'] = 'Animal Care LA County'
  end

end