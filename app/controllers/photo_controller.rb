class PhotoController < ApplicationController

  def new
  	@photos = current_user.profile.photos
    @profile = current_user.profile
    respond_to do |format|
      format.html 
      format.json { render json: @photos.map{|photo| photo.to_jq_upload } }
    end
  end

  def create
  	ext = params[:photo_data][11..14][/jpeg|jpg|png/]
    file = Tempfile.new(["pic", ".#{ext}"])

    @photo = Photo.new(file: file)
    @photo.profile_id = current_user.profile.id

    respond_to do |format|

    if @photo.save
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_upload]}, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
  end

  def destroy
  end
  
end