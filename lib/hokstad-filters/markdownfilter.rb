
require 'rdiscount'
require 'hokstad-filters/batchfilter'


class MarkdownFilter < BatchFilter
  def do_flush
    @d = RDiscount.new(@d).to_html
  end
end



def markdown data
  MarkdownFilter.process(data)
end

