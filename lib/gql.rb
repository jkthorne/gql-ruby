require "gql/version"
require "gql/mutation"

module GQL
  class Error < StandardError; end

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
    gql = Fragment.new(name, node)
    yield gql
    gql.build
  end

  def self.mutation
    gql = Mutation.new
    yield gql
    gql.build
  end
end
