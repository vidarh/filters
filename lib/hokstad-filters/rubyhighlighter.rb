
require 'hokstad-filters/filter'
require 'syntax/convertors/html'

class HighlightFilter < Filter

  def initialize n = nil
    super
    @d = ""
    @c = nil
    @cur = nil
  end

  def filter line, tag
    if !@cur && !tag
      pass(line,tag)
      return
    end

    if tag != @cur
      do_flush if @cur
      if tag
        @c = Syntax::Convertors::HTML.for_syntax tag.to_s
      else
        @c = nil
      end
      if @c
        @cur = tag 
      else
        @cur = nil
      end
    end

    if @cur
      @d.concat(line)
    else
      pass(line,tag)
    end
  end

  def do_flush
    return if @d == ""
    pass(@c.convert(@d,false),:html)
    @d = ""
  end

end

    
