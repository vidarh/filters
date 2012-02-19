
require 'hokstad-filters/filter'

# Adds assorted inline markup options to Markdown
class InlineMarkupFilter < Filter

  def initialize n = nil
    super
  end

  def filter line, tag = nil
    line.gsub!(/~~?((\\~|[^~])+)~~?/,'<del>\1</del>')
    line.gsub!('\~','~')
    pass(line,tag)
  end
end
