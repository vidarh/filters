
require 'hokstad-filters/filter'

class BatchFilter < Filter
  def initialize n = nil
    super
    @d = ""
  end
  
  def filter line, tag
    @d.concat(line)
  end

  # Override "do_filter" to do something with @f
  # on flush.

  def data
    @d
  end
end
