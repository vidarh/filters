
# Allow pre with "{{{" and "}}}"

class AutoPrePrefixFilter < Filter
 def initialize n = nil
   super
   @in_pre = false
 end
  
  def filter line, tag = nil
    if line == "{{{\n" || line == "{{{"
      @in_pre = true
    elsif line == "}}}\n" || line == "}}}"
      @in_pre = false
    else
      if @in_pre
        pass("    "+line,tag)
      else
        pass(line,tag)
      end
    end
  end
end
