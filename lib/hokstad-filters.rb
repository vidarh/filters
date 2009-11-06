
require 'hokstad-filters/precodefilter'
require 'hokstad-filters/markdownfilter'
require 'hokstad-filters/rubyhighlighter'
require 'hokstad-filters/formfilter'

def extended_markdown(data)
  Filter.chain(FormFilter,PreCodeFilter,RubyHighlighter,MarkdownFilter).process(data)
end
