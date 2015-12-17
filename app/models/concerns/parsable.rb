module Parsable extend ActiveSupport::Concern
  # private
  def md_to_html
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(filter_html: true, safe_links_only: true, with_toc_data: true), fenced_code_blocks: true, disable_indented_code_blocks: true, superscript: true, underline: true, tables: true, autolink: true, strikethrough: true, highlight: true, footnotes: true, no_intra_emphasis: true)
    html = parser.render(self.content_md)
    self.content_html = add_syntax_highlight(html)
    # raise 'hell'
  end

  # convert html 'code blocks' into syntax highlighted html with inline styling
  def add_syntax_highlight(html)
    require 'coderay'
    doc = Nokogiri::HTML(html)
    code_blocks = doc.css('code')
    code_blocks.each do |code_element|
      next if code_element.content.lines.count == 1
      lang = code_element.attribute('class').value unless code_element.attribute('class').nil?
      code = code_element.content
      syntax_highlighted_html = CodeRay::scan(code, lang || 'code').html(:line_numbers => :table)
      code_element.inner_html = syntax_highlighted_html
    end
    doc
  end
end