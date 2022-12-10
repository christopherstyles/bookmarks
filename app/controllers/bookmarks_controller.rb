# frozen_string_literal: true

class BookmarksController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_bookmark, only: %i(show edit update destroy)

  def index
    @pagy, @bookmarks = pagy(
      Bookmark.includes(:tags).order(created_at: :desc).all, items: 10,
    )
  end

  def show; end

  def new
    @bookmark = Bookmark.new
  end

  def edit; end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: t(".success")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: t(".success")
  end

  def search
    @pagy, @bookmarks = pagy(
      Bookmark.includes(:tags, :taggings)
              .tagged_with(tags_from_params)
              .order(created_at: :desc),
      items: 10,
    )

    render "index"
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:notes, :tag_list, :title, :url)
  end

  def tags_from_params
    params[:q].split(",").map(&:strip)
  end
end
