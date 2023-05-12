# frozen_string_literal: true

class BookmarksController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_bookmark, only: %i(show edit update destroy)

  def index
    @pagy, @bookmarks = pagy(
      current_user.bookmarks.includes(:tags).order(created_at: :desc).all, items: 25,
    )
  end

  def show; end

  def new
    @bookmark = current_user.bookmarks.new
  end

  def edit; end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)

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
    redirect_to bookmarks_path, notice: t(".success"), status: :see_other
  end

  def search
    @pagy, @bookmarks = pagy(
      current_user.bookmarks.includes(:tags, :taggings)
              .tagged_with(tags_from_params)
              .order(created_at: :desc),
      items: 10,
    )

    render "index"
  end

  private

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:notes, :tag_list, :title, :url)
  end

  def tags_from_params
    params[:q].split(",").map(&:strip)
  end
end
