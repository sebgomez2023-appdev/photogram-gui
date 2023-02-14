class PhotosController < ApplicationController
  def index_photos
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
    
    render({ :template => "photo_templates/index_photos.html.erb" })
  end

  def show_photos
    
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({:id => url_id})

    @the_photo = matching_photos.at(0)


    render({ :template => "photo_templates/show_photos.html.erb" })
  end
end
