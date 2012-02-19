
require 'hokstad-filters/inlinemarkupfilter'

describe InlineMarkupFilter do
  it "takes a string of characters enclosed by '~' and surrounds them by <del/> tags" do
    Filter.chain(InlineMarkupFilter).process("~abc~").should == "<del>abc</del>"
    Filter.chain(InlineMarkupFilter).process("X~abc 123 - this is a test~foo").should == "X<del>abc 123 - this is a test</del>foo"
    Filter.chain(InlineMarkupFilter).process("~2012-02-14~").should == "<del>2012-02-14</del>"
  end
end
