
require 'hokstad-filters/precodefilter'
require 'hokstad-filters/markdownfilter'

def extended_markdown(data)
  Filter.chain(PreCodeFilter,MarkdownFilter).process(data)
end
