
class OutputSink
  attr_reader :data
  
  def initialize
    @data = ""
  end

  def filter line
    @data.concat(line)
  end

  def flush
  end
end
