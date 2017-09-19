class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit update destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.order(created_at: :desc).all
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  # rubocop:disable Metrics/MethodLength
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html do
          redirect_to @bookmark, notice: t('.success')
        end

        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json do
          render json: @bookmark.errors, status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: t('.success') }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json do
          render json: @bookmark.errors, status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html do
        redirect_to(
          bookmarks_url,
          notice: t('.success'),
        )
      end
      format.json { head :no_content }
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:notes, :tag_list, :title, :url)
  end
end
