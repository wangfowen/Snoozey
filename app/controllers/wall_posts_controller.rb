class WallPostsController < ApplicationController

  before_filter :authenticate_user

  # GET /wall_posts
  # GET /wall_posts.json
  def index
    @graph = Koala::Facebook::API.new(@access_token)
    if (wall_post = @user.wall_posts.unposted.first).nil?
      @wall_post = WallPost.create(:user_id => @user.id)
    else
      @wall_post = wall_post
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wall_posts }
    end
  end

  # GET /wall_posts/new
  # GET /wall_posts/new.json
  def new
    @wall_post = WallPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wall_post }
    end
  end

  # GET /wall_posts/1/edit
  def edit
    @wall_post = WallPost.find(params[:id])
  end

  # POST /wall_posts
  # POST /wall_posts.json
  def create
    @wall_post = WallPost.new(params[:wall_post])

    respond_to do |format|
      if @wall_post.save
        format.html { redirect_to @wall_post, notice: 'Wall post was successfully created.' }
        format.json { render json: @wall_post, status: :created, location: @wall_post }
      else
        format.html { render action: "new" }
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wall_posts/1
  # PUT /wall_posts/1.json
  # If from mobile device, PUT /wall_posts.json
  def update
    if params[:id]
      @wall_post = WallPost.find(params[:id])
      @wall_post.post = params[:post]
    else
      if (wall_post = @user.wall_posts.unposted.first).nil?
        @wall_post = WallPost.create(:user_id => @user.id, :post => "I'm so lazy I overslept my alarm again")
      else
        @wall_post = wall_post
      end
      @wall_post.post_to_facebook!
    end

    respond_to do |format|
      if @wall_post.update_attributes(params[:wall_post])
        format.html { redirect_to wall_posts_url }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wall_posts/1
  # DELETE /wall_posts/1.json
  def destroy
    @wall_post = WallPost.find(params[:id])
    @wall_post.destroy

    respond_to do |format|
      format.html { redirect_to wall_posts_url }
      format.json { head :ok }
    end
  end
end
