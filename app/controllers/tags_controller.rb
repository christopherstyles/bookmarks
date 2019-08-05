class TagsController < ApplicationController
  include Pagy::Backend

  before_action :require_login

  def search
    @pagy, @tags = pagy(
      Tag.where('name ILIKE ?', "#{params[:q]}%")
         .order(name: :asc).all,
    )

    render json: { tags: @tags }.to_json
  end
end
