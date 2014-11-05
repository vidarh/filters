
require 'hokstad-filters/precodefilter'
require 'hokstad-filters/markdownfilter'
require 'hokstad-filters/rubyhighlighter'
require 'hokstad-filters/formfilter'
require 'hokstad-filters/inlinemarkupfilter'
require 'hokstad-filters/autoprefixfilter'
require 'hokstad-filters/githubcodefencefilter'

def extended_markdown(data)
  Filter.chain(FormFilter,AutoPrePrefixFilter,PreCodeFilter,HighlightFilter,InlineMarkupFilter,MarkdownFilter).process(data)
end
