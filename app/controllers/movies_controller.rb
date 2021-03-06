class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :show, :destroy, :move]
  before_action :authenticate_user!, except: [:index, :show, :edit]
  def index
    if current_user.present?
     @movies = policy_scope(Movie)
    #  Movie.eager_load(:reviews).with_positive_reviews
     #@movies = Movie.with_positive_reviews
    #  @movies = Movie.review_present
    end

  end
  def review
    if current_user.present?
     @movies = Movie.with_positive_reviews
    end
  end
  def search 
    @movies = Movie.movie_search(params[:q])
    #Movie.where("title LIKE?","%"+params[:q]+"%")
  end
  def new
    
    @movie = current_user.movies.build
    @movie.cast_members.build
    @movie.pictures.build
    authorize @movie
  end
  def create
    
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
    @favourite_exists = Favourite.where(movie: @movie, user: current_user) == [] ? false : true
  end

  def edit
    authorize @movie 
  end
  def update
     if current_user && current_user.role == "Moderator" 
     @movie.genre = "Draft"
    if @movie.update(movie_params)  
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end

elsif current_user && current_user.role == "Admin"
  if @movie.update(movie_params)  
    redirect_to movie_path(@movie)
  else
    render 'edit'
  end
end
  end
  def destroy
    
    @movie.destroy
    redirect_to root_path
  end
  def move
    #byebug
    @movie.insert_at(params[:position].to_i)
    head :ok
  end


  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
  def movie_params
    params.require(:movie).permit(:title, :position, :description, :movie_length, :director, :rating, :image, :status,:genre, cast_members_attributes: [:id,:name, :role, :_destroy], pictures_attributes: [ :id, pictures:[] ] )
  end
end
