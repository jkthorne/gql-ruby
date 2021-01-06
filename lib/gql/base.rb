class GQL::Base
  attr_reader :io, :built

  def initialize
    @io = ""
    @built = false
  end

  def build
    return io if built

    @io << " }"
    @built = true

    io
  end

  def dots
    io << "..."
  end

  def method_missing(m, *args, **kargs, &block)
    if m.to_s.start_with?("dots_")
      io << "...#{m[5..-1]} "
    elsif m.to_s.start_with?("on_")
      io << "...on #{m[3..-1]} "
    elsif m.to_s.start_with?("at_")
      io << "@#{m[3..-1]}"
    else
      io << " #{m.to_s.gsub("_", ":")}"
    end

    if kargs.any?
      io << "(" << kargs.map{ |k, v| "#{k}: #{v}" }.join(", ") << ")"
    elsif args.size == 1
      io << ": #{args.first}"
    elsif args
      io << args.map{ |a| "(#{a}: $#{a})" }.join(", ")
    end

    if block_given?
      io << " { "
      yield
      io << " }"
    end
  end
end