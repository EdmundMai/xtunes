class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json


  def own
    if @auth_user
      @songs = @auth_user.songs
    else
      @songs = []
    end
    render :index
  end

  def refund
    if @auth_user
      song = Song.find(params[:id])
      if @auth_user.songs.include?(song)
        @auth_user.balance += song.cost
        @auth_user.songs.delete(song)
        @auth_user.save
        flash[:notice] = "Song refunded!"
        redirect_to songs_path
      end
    else
      redirect_to login_path
    end
  end

  def purchase
    if @auth_user
      song = Song.find(params[:id])
      if (@auth_user.balance >= song.cost) && !@auth_user.songs.include?(song)
        @auth_user.songs << song
        @auth_user.balance -= song.cost
        @auth_user.save
        flash[:notice] = "Song purchased!"
        redirect_to songs_path
      end
    else
      redirect_to login_path
    end
  end


  def like
    song_id = params[:id]
    song = Song.find(song_id)
    song.like += 1
    song.save
    redirect_to songs_path
  end

  def unlike
    song_id = params[:id]
    song = Song.find(song_id)
    song.like -= 1
    song.save
    redirect_to songs_path
  end

  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end
end
