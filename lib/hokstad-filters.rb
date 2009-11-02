
require 'hokstad-markdown/precodefilter'
require 'hokstad-markdown/markdownfilter'

def extended_markdown(data)
  Filter.chain(PreCodeFilter,MarkdownFilter).process(data)
end
