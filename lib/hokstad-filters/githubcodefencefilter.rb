
# Fence code blocks with ```[language] ... ``` like at github.
# Expected to be fed into PreCodeFilter if you want automatic pre's created

class GitHubCodeFenceFilter < Filter
  def initialize n = nil
    super
    @in_pre = false
  end

  def filter line, tag = nil
    if (line[0..2] == "```") && !@in_pre
      @in_pre = true
      pass("-#{line[3..-1].chomp}-\n") if line.size > 3
    elsif line == "```\n" || line == "```"
      @in_pre = false
      @lang = nil
    else
      if @in_pre
        pass("    "+line,tag)
      else
        pass(line,tag)
      end
    end
  end
end
