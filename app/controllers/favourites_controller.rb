class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all

    render("favourites/index.html.erb")
  end

  def show
    @favourite = Favourite.find(params[:id])

    render("favourites/show.html.erb")
  end

  def new
    @favourite = Favourite.new

    render("favourites/new.html.erb")
  end

  def create
    @favourite = Favourite.new

    @favourite.movie_id = params[:movie_id]
    @favourite.user_id = params[:user_id]

    save_status = @favourite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favourites/new", "/create_favourite"
        redirect_to("/favourites")
      else
        redirect_back(:fallback_location => "/", :notice => "Favourite created successfully.")
      end
    else
      render("favourites/new.html.erb")
    end
  end

  def edit
    @favourite = Favourite.find(params[:id])

    render("favourites/edit.html.erb")
  end

  def update
    @favourite = Favourite.find(params[:id])

    @favourite.movie_id = params[:movie_id]
    @favourite.user_id = params[:user_id]

    save_status = @favourite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favourites/#{@favourite.id}/edit", "/update_favourite"
        redirect_to("/favourites/#{@favourite.id}", :notice => "Favourite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Favourite updated successfully.")
      end
    else
      render("favourites/edit.html.erb")
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])

    @favourite.destroy

    if URI(request.referer).path == "/favourites/#{@favourite.id}"
      redirect_to("/", :notice => "Favourite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Favourite deleted.")
    end
  end
end
