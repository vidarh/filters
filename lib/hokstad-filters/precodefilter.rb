
require 'hokstad-markdown/filter'

class PreCodeFilter < Filter

  def initialize n = nil
    super
    @pre_class = nil
    @in_pre = false
  end

  def filter line
    line.chomp!
    
    if line =~ /-([a-z]+)-/
      @pre_class = $1
    elsif line =~ /^    .*/
      if !@in_pre 
        pass("<pre class='#{@pre_class}'><code>\n") if @pre_class
      end
      @in_pre = true
      pass(line.concat("\n"))
    else
      if @in_pre && @pre_class && line != ""
        pass(line.concat"\n")
        pass("</code></pre>\n")
        @in_pre = false
        @pre_class = nil
      else
        pass(line.concat("\n"))
      end
    end
  end

  def flush
    if @in_pre && @pre_class
      pass("</code></pre>\n")
    end
    super
  end
end
