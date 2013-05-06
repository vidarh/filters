
require 'hokstad-filters/filter'

class PreCodeFilter < Filter

  def initialize n = nil
    super
    @pre_class = nil
    @in_pre = false
  end

  def filter line, tag = nil
    line.chomp!
    
    if line =~ /^-([a-z]+)-/
      @pre_class = $1.to_sym
    elsif line =~ /^    .*/
      if !@in_pre 
        pass("<pre class='#{@pre_class.to_s}'><code>\n") if @pre_class
      end
      @in_pre = true
      pass(line.concat("\n"),@pre_class)
    else
      if @in_pre && @pre_class
        pass(line.concat("\n"),@pre_class)
        pass("</code></pre>\n")
        @pre_class = nil
      else
        pass(line.concat("\n"))
      end
      @in_pre = false
    end
  end

  def flush
    if @in_pre && @pre_class
      pass("</code></pre>\n")
    end
    super
  end
end
