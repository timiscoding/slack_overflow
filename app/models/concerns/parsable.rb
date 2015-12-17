module Parsable extend ActiveSupport::Concern
  def md_to_html
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(filter_html: true, safe_links_only: true, with_toc_data: true), fenced_code_blocks: true, disable_indented_code_blocks: true, superscript: true, underline: true, tables: true, autolink: true, strikethrough: true, highlight: true, footnotes: true, no_intra_emphasis: true)
    html = parser.render(self.content_md)
    self.content_html = add_syntax_highlight(html)
  end

  # convert html 'code blocks' into syntax highlighted html with inline styling
  def add_syntax_highlight(html)
    require 'coderay'
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    code_blocks = doc.css('code')
    code_blocks.each do |code_element|
      next if code_element.content.count("\n").zero?
      lang = code_element.attribute('class').value unless code_element.attribute('class').nil?
      code = code_element.content
      syntax_highlighted_html = CodeRay::scan(code, lang || 'code').html(:line_numbers => :table)
      code_element.inner_html = syntax_highlighted_html
    end
    doc
  end

  def last_update
    if self.instance_of? Post
      self.last_update = self.updated_at
    elsif self.instance_of? Comment
      return if self.post.nil?
      self.post.last_update = self.updated_at
      self.post.save
    end
  end
end