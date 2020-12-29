require "gql/version"

class GQL
  class Error < StandardError; end

  attr_reader :io

  def initialize
    @io = ""
  end

  def method_missing(m, *args, **kargs, &block)
    if m.to_s.start_with?("dots_")
      io << "...#{m[5..-1]}"
    else
      io << " #{m}"
    end

    if kargs
      io << kargs.map{ |k, v| "(#{k}: #{v})" }.join(", ")
    elsif args
      io << args.map{ |a| "(#{a}: $#{a})" }.join(", ")
    end

    if block_given?
      io << " { "
      yield
      io << " }"
    end
  end

  def dots
    io << "..."
  end

  def self.query
    gql = new
    gql.io << "query { "
    yield gql
    gql.io << " }"
    gql.io.to_s
  end

  def self.fragment(name, node)
    gql = new
    gql.io << "fragment #{name} on #{node} { "
    yield gql
    gql.io << " }"
    gql.io.to_s
  end
end
