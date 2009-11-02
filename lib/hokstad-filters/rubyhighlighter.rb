
require 'hokstad-filters/filter'

class RubyHighlighter < Filter

  def initialize n = nil
    super
    @d = ""
    @c = Syntax::Convertors::HTML.for_syntax "ruby"
  end

  def filter line, tag
    if tag == :ruby
      @d.concat(line)
    else
      do_flush
      pass(line,tag)
    end
  end

  def do_flush
    return if @d == ""
    pass(@c.convert(@d,false),:html)
    @d = ""
  end

end

    
