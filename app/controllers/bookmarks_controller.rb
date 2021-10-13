# frozen_string_literal: true

class BookmarksController < ApplicationController
  include Pagy::Backend

  before_action :require_login
  before_action :set_bookmark, only: %i[show edit update destroy]

  def index
    @pagy, @bookmarks = pagy(
      Bookmark.includes(:tags).order(created_at: :desc).all, items: 10
    )
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end

  # rubocop:disable Metrics/MethodLength
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html do
          redirect_to @bookmark, notice: t(".success")
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

  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: t(".success") }
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

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html do
        redirect_to(
          bookmarks_url,
          notice: t(".success")
        )
      end
      format.json { head :no_content }
    end
  end

  def search
    @pagy, @bookmarks = pagy(
      Bookmark.includes(:tags, :taggings)
              .tagged_with(tags_from_params)
              .order(created_at: :desc),
      items: 10
    )

    render :index
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
