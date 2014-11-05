
# Replace 'git:[git reference] or "in [git reference]" to a link
# to @base+reference so that you can type aforementioned patterns to
# generate an automatic link to a Github or Bitbucket repository (or
# any other site where you can link a Git commit with this pattern)
#
# Note that by default, if you happen to write "in ..." where "..." is
# any string of 7 or more hexadecimal digits (so any regular *word*
# consisting only of 'a' through 'f' of 7 letters or more). Though
# the number of English 7+ letter words only using a-f is quite small.
# 
# To prevent this, pass any truthy value as the second parameter to #new,
# or add (any) extra character between 'in' and the word

class GitFilter < Filter

  def initialize base, strict = false
    @base = base
    @strict = strict
    super()
  end

  def filter(line,tag=nil)
    line.gsub!(/git:([0-9a-f]{7,})/,"<a href=\"#{@base}\\1\">\\1</a>")
    line.gsub!(/ in ([0-9a-f]{7,})/," in <a href=\"#{@base}\\1\">\\1</a>") unless @strict
    pass(line,tag)
  end
end
