# frozen_string_literal: true

class UnfurlsController < ApplicationController
  before_action :authenticate_user!

  def index
    page = MetaInspector.new(
      url_from_params
    )

    render json: page.to_json
  end

  private

  def url_from_params
    CGI.unescape(params[:url])
  end
end
