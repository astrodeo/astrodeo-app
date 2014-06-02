require 'securerandom'

class ObservationsController < ApplicationController
  before_action :set_obersvation, only: [:show, :edit, :update, :destroy]

  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.all()
  end
  
  def feed
    @observations = Observation.where(:feed_id => params[:fid])
    @feed = Feed.find(params[:fid])
    @following = Followers.where(:user_id => @feed.user_id)
    @followers = Followers.where(:feed_id => @feed.id)
    if @current_user
      is_following = Followers.where(:feed_id => @feed.id, :user_id => @current_user.id)
      if is_following
        @is_current_user_following = true;
      else
        @is_current_user_following = false;
      end
    end
  end

  # GET /observations/1
  # GET /observations/1.json
  def show
  end

  # GET /observations/new
  def new
    @observations = Observation.new(obs)
  end

  # GET /observations/1/edit
  def edit
  end

  # POST /observations
  # POST /observations.json
  def create
    uploaded_photo = params[:photo]
    logger.debug uploaded_photo
    #TODO better nameing convention
    new_file_name = "#{SecureRandom.uuid.gsub("-","")}#{File.extname(uploaded_photo.original_filename)}"
    #new_file_name = Time.now.to_s + "." + uploaded_photo.original_filename.split('.').last
    final_name = File.join(photo_dir,new_file_name)
    File.open(final_name, 'wb') do |file|
      file.write(uploaded_photo.read)
    end
    @observation = Observation.new(obersvation_params)
    location = Location.new(locations_params)
    @observation.location = location
    @observation.photos = [Photo.new(:path => new_file_name)]
    @observation.feed_id = current_user.feed.id
    
    if @observation.save
      redirect_to :controller => 'feeds', :action => 'index', :fid => current_user.feed.id
    else
      #TODO error handling
    end

  end

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observations.update(obersvation_params)
        format.html { redirect_to @obersvation, notice: 'Obersvation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @obersvation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    @observations.destroy
    respond_to do |format|
      format.html { redirect_to observations_url }
      format.json { head :no_content }
    end
  end

  def photo
    @observation = Observation.find(params[:id])
    @photo = @observation.photos.first
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obersvation
      @observations = Observation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obersvation_params
      params.require(:observation).permit(:right_ascension, :declination, :magnitude, :seen)
    end
    def locations_params
      params.require(:location).permit(:latitude, :longitude, :altitude)
    end

  def photo_dir
    folder = "images"
    prefix = ENV['OPENSHIFT_DATA_DIR'] ? "#{ENV['OPENSHIFT_DATA_DIR']}/" : ""
    File.join(prefix, folder)
  end

  def photo_url

  end
end
