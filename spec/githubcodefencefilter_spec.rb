
require 'hokstad-filters/githubcodefencefilter'

describe "GitHubCodeFenceFilter" do
  it "pre/code open tags must not be missing if there's a past empty markdown-style pre-block" do
    chain = Filter.chain(GitHubCodeFenceFilter)
    res = chain.dup.process("```\ntest\n```").should match("    test\n")
    res = chain.dup.process("```ruby\ntest\n```").should match("    test\n")
    res = chain.dup.process("```ruby\ntest\n```").should match("-ruby-\n    test\n")
  end
end
