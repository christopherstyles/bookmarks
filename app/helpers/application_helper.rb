# frozen_string_literal: true

require "rouge/plugins/redcarpet"

class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module ApplicationHelper
  include Pagy::Frontend

  def feather_icon(name, options = {})
    content_tag(
      :i,
      nil,
      options.deep_merge(
        data: {
          feather: name,
          controller: "feather",
        },
      ),
    )
  end

  def key_for_bootstrap(key = :info)
    case key.to_sym
    when :notice, :success then "success"
    when :warning then "warning"
    when :error then "danger"
    else "info"
    end
  end

  def markdown(text)
    renderer = HTML.new(markdown_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_extensions)
    markdown.render(text)
  end

  private

  def markdown_extensions
    {
      autolink: true,
      superscript: true,
      fenced_code_blocks: true,
    }
  end

  def markdown_options
    {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: "nofollow", target: "_blank" },
      space_after_headers: true,
    }
  end
end
