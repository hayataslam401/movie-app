class FavouritesController < ApplicationController
  def update
    favourite = Favourite.where(movie: Movie.find(params[:movie]), user: current_user)
  if favourite == []
    Favourite.create(movie: Movie.find(params[:movie]), user: current_user)
    @favourite_exists = true
  else
    favourite.destroy_all
    @favourite_exists = false
  end
  respond_to do |format|
    format.js
  end
end
end
