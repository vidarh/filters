
require 'rdiscount'
require 'hokstad-filters/filter'


class MarkdownFilter < Filter
  def initialize n = nil
    super
    @d = ""
  end
  
  def filter line, tag
    @d.concat(line)
  end

  def do_flush
    @d = RDiscount.new(@d).to_html
  end

  def data
    @d
  end
end



def markdown data
  MarkdownFilter.process(data)
end

