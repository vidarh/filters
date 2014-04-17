
require 'hokstad-filters/outputsink'

class Filter
  attr_accessor :next_filter

  def initialize n = nil
    @next_filter = n || OutputSink.new
  end

  def self.chain *filters
    fcur = f = self.new

    filters.inject(f) do |fcur,fc|
      fobj = fc.is_a?(Class) ? fc.new : fc
      fcur.attach(fobj)
      fobj
    end

    f
  end

  def process data
    data.split("\n").each do |line|
#      STDERR.puts line.inspect
      filter(line+"\n")
    end
    flush
    to_s
  end

  def self.process data
    self.new.process(data)
  end

  def attach c
    # If not responds to :attach, it must be a sink, and will be replaced
    #return @next_filter.attach(c) if @next_filter && @next_filter.respond_to?(:attach) 
    c = c.new if c.is_a?(Class)
    @next_filter = c
    self
  end

  def self.attach c
    self.new.attach(c)
  end

  def data
    @next_filter.data
  end

  def to_s
    data
  end

  def pass line, tag= nil
    @next_filter.filter(line,tag)
  end

  def do_flush
  end

  def filter line, tag = nil
    @next_filter.filter(line,tag) if @next_filter
  end

  def flush
    do_flush
    @next_filter.flush if @next_filter
  end
end

