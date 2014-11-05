
require 'hokstad-filters/gitfilter'

describe "GitFilter" do
  let(:chain) { Filter.chain(GitFilter.new("http://example.com/")) }
  let(:chainstrict) { Filter.chain(GitFilter.new("http://example.com/", :strict)) }
                           
  it "will turn git:<7 hex digits> into link" do
    chain.process("git:abcd012").should eq("<a href=\"http://example.com/abcd012\">abcd012</a>\n")
  end

  it "will leave git:<6 hex digits> alone" do
    chain.process("git:abcd01").should eq("git:abcd01\n")
  end

  it "will turn git:<12 hex digits> (or anything greater than 7) into link" do
    chain.process("git:0123456789ef").should eq("<a href=\"http://example.com/0123456789ef\">0123456789ef</a>\n")
  end

  it "will turn ' in <7 hex digits>' into link" do
    chain.process(" in abcd012").should eq(" in <a href=\"http://example.com/abcd012\">abcd012</a>\n")
  end

  it "will *not* process 'in <7 hex digits>' prefixed by something other than space into link" do
    chain.process("fooin abcd012").should eq("fooin abcd012\n")
  end

  it "will unfortunately misinterpret 'in <7+ letter word using a-f>' as link" do
    chain.process(" in acceded").should eq(" in <a href=\"http://example.com/acceded\">acceded</a>\n")
  end

  it "will not misinterpret 'in <7+ letter word>' if it uses non-hexadecimal digits" do
    chain.process(" in bananas").should eq(" in bananas\n")
  end

  it "will not misinterpret 'in <7+ letter word>' as link if an extra space is added between 'in' and the word" do
    chainstrict.process(" in  acceded").should eq(" in  acceded\n")
  end

  it "will not misinterpret 'in <7+ letter word>' as link if a linefeed is added between 'in' and the word" do
    chainstrict.process(" in \nacceded").should eq(" in\nacceded\n")
  end

  it "will not misinterpret 'in <7+ letter word>' as link if constructor is passed a truthy value (:strict recommended) as the second value" do
    chainstrict.process(" in acceded").should eq(" in acceded\n")
  end
end
