
require 'rdiscount'
require 'hokstad-filters/batchfilter'


class MarkdownFilter < Filter
  def do_flush
    @d = RDiscount.new(data).to_html
  end
end



def markdown data
  MarkdownFilter.process(data)
end

