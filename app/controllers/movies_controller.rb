class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    matching_movies = Movie.all

    @movies = matching_movies.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html do
        
      end
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
    #the_id = params.fetch(:id)

    #matching_movies = Movie.where( id: the_id )

    #@the_movie = matching_movies.first

  end

  def create
    
    movie_attributes = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attributes)
    
    #@movie = Movie.new
    #@movie.title = params.fetch(:movie).fetch(:title)
    #@movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url,  notice: "Movie created successfully." 
    else
      
    end
  end

  def edit
    the_id = params.fetch(:id)

    matching_movies = Movie.where(id: the_id )

    @movie = matching_movies.first

  end

  def update
    movie_attributes = params.require(:movie).permit(:title, :description)
    matching_movies = Movie.find(params.fetch(:id))
    

    # the_id = params.fetch(:id)
    # the_movie = Movie.where( id: the_id ).first

    # the_movie.title = params.fetch("query_title")
    # the_movie.description = params.fetch("query_description")

    if matching_movies.update(movie_attributes)
      matching_movies.save
      redirect_to movies_url, notice: "Movie updated successfully."
    else
      redirect_to movies_url,  alert: "Movie failed to update successfully." 
    end
  end

  def destroy
    the_id = params.fetch(:id)
    the_movie = Movie.where(id: the_id ).first

    the_movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end
