module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(markdown_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_extensions)

    markdown.render(text)
  end

  private

  def markdown_extensions
    {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true,
    }
  end

  def markdown_options
    {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true,
    }
  end
end
