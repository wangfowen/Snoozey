class ShamesController < ApplicationController
  # GET /shames
  # GET /shames.json

  def index
    @shames = Shame.all
    #@access_token = facebook_cookies['access_token']
    #@graph = Koala::Facebook::GraphAPI.new(@access_token)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shames }
    end
  end

  # GET /shames/1
  # GET /shames/1.json
  def show
    @shame = Shame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shame }
    end
  end

  # GET /shames/new
  # GET /shames/new.json
  def new
    @shame = Shame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shame }
    end
  end

  # GET /shames/1/edit
  def edit
    @shame = Shame.find(params[:id])
  end

  # POST /shames
  # POST /shames.json
  def create
    @shame = Shame.new(params[:shame])

    respond_to do |format|
      if @shame.save
        format.html { redirect_to @shame, notice: 'Shame was successfully created.' }
        format.json { render json: @shame, status: :created, location: @shame }
      else
        format.html { render action: "new" }
        format.json { render json: @shame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shames/1
  # PUT /shames/1.json
  def update
    @shame = Shame.find(params[:id])

    respond_to do |format|
      if @shame.update_attributes(params[:shame])
        format.html { redirect_to @shame, notice: 'Shame was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @shame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shames/1
  # DELETE /shames/1.json
  def destroy
    @shame = Shame.find(params[:id])
    @shame.destroy

    respond_to do |format|
      format.html { redirect_to shames_url }
      format.json { head :ok }
    end
  end
end
