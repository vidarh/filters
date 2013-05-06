
require 'hokstad-filters/rubyhighlighter'
require 'hokstad-filters/precodefilter'
require 'hokstad-filters/markdownfilter'
require 'hokstad-filters/autoprefixfilter'
require 'hokstad-filters/inlinemarkupfilter'

describe "HighLightFilter" do
  it "pre/code open tags must not be missing if there's a past empty markdown-style pre-block" do
    res = Filter.chain(PreCodeFilter,HighlightFilter).process(<<END)
    test
Four spaces on above line
-foo-
    Four spaces

END

    res.should match(/<pre /)
    res.should match(/<code>/)
  end
end
