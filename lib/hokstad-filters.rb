
require 'hokstad-filters/precodefilter'
require 'hokstad-filters/markdownfilter'
require 'hokstad-filters/rubyhighlighter'

def extended_markdown(data)
  Filter.chain(PreCodeFilter,RubyHighlighter,MarkdownFilter).process(data)
end
