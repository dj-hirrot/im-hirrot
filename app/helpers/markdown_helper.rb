module MarkdownHelper
  require 'custom_markdown_renderer'
  def markdown(text)
    # unless @markdown
    #   options = {
    #     filter_html: true,
    #     autolink: true,
    #     space_after_headers: true,
    #     no_intra_emphasis: true,
    #     fenced_code_blocks: true,
    #     tables: true,
    #     hard_wrap: true,
    #     xhtml: true,
    #     lax_html_blocks: true,
    #     strikethrough: true
    #   }
    #   renderer = Redcarpet::Render::HTML.new(options)
    #   @markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    # end
    # @markdown.render(text).html_safe
    render_options = {
      filter_html: false,
      hard_wrap: true
    }
    # renderer = Redcarpet::Render::HTML.new(render_options)
    renderer = Redcarpet::Render::HTML::CustomMarkdownRenderer.new(render_options)

    extensions = {
      autolink: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true,
      tables: true,
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
