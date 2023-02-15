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

  def delete_photos
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/delete_photos.html.erb" })
    redirect_to("/photos")
  end

  def create
    #Parameters: {"query_image"=>"", "query_caption"=>"", "query_owner_id"=>""}
    
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save
   
    redirect_to("/photos/"+ a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/"+ the_photo.id.to_s)

    # render({:template => "photo_templates/create.html.erb"})
  end

  def comment
    # input_author_id, input_body 

    the_id = params.fetch("input_photo_id")
    the_author = params.fetch("input_author_id")
    the_comment = params.fetch("input_body")

    a_new_comment = Comment.new

    a_new_comment.id = the_id
    a_new_comment.author_id = the_author
    a_new_comment.body = the_comment

    a_new_comment.save

    redirect_to("/photos/" + the_id.to_s)

    # render({:template => "photo_templates/new_comment.html.erb"})
  end


 

end
