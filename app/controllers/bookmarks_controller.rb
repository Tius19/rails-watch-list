class BookmarksController < ApplicationController

  def new
    # We need @restaurant in our `simple_form_for`
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def show
    @movie = Movie.new
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  # def set_list
  #   @list = List.find(params[:restaurant_id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
