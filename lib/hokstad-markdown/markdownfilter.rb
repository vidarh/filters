
require 'rdiscount'
require 'filter'


class MarkdownFilter < Filter
  def initialize n = nil
    super
    @d = ""
  end
  
  def filter line
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

