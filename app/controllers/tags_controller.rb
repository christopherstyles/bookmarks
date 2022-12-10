# frozen_string_literal: true

class TagsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  def search
    @pagy, @tags = pagy(
      Tag.where("name ILIKE ?", "#{params[:q]}%")
         .order(name: :asc).all,
    )

    render json: { tags: @tags }.to_json
  end
end
