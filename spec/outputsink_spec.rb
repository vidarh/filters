
require 'hokstad-filters/filter'
require 'hokstad-filters/outputsink'

describe "OutputSink" do
  it "should not alter the input" do
    input = <<END
<pre class="asm">
   jmp .L2
.L3:
    call    bar
.L2:
    call    foo
    testl   %eax, %eax
    jne .L3
</pre>
END

    res = Filter.new.process(input)

    res.should match(input)
  end
end
