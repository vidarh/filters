
require 'hokstad-filters/precodefilter'
require 'hokstad-filters/markdownfilter'
require 'hokstad-filters/rubyhighlighter'
require 'hokstad-filters/formfilter'
require 'hokstad-filters/inlinemarkupfilter'

def extended_markdown(data)
  Filter.chain(FormFilter,PreCodeFilter,RubyHighlighter,InlineMarkupFilter,MarkdownFilter).process(data)
end
