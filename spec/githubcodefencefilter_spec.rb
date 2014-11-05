
require 'hokstad-filters/githubcodefencefilter'

describe "GitHubCodeFenceFilter" do
  let(:chain) { Filter.chain(GitHubCodeFenceFilter) }

  it "A section of text enclosed in ```+LF should get prefixed by four spaces" do
    chain.process("```\ntest\n```").should eq("    test\n")
  end

  it "If a string is passed after ```, it will get translated to -string-, suitable for feeding to PreCodeFilter" do
    chain.process("```ruby\ntest\n```").should eq("-ruby-\n    test\n")
  end
end
