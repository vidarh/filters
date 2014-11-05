

require 'hokstad-filters'

describe "extended_markdown" do
  it "should pass <pre> code through unmodified" do
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

    res = extended_markdown(input)

    res.should match(input)
  end
end
