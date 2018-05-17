module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(markdown_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_extensions)

    markdown.render(text)
  end

  def flash_key_for_css(key)
    case key
    when 'notice' then 'toast toast-primary'
    when 'success' then 'toast toast-success'
    when 'error' then 'toast toast-error'
    when 'alert' then 'toast toast-warning'
    else 'toast'
    end
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
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
    }
  end
end
