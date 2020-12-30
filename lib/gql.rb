require "gql/version"
require "gql/base"
require "gql/enum"
require "gql/extend"
require "gql/fragment"
require "gql/input"
require "gql/interface"
require "gql/mutation"
require "gql/query"
require "gql/type"
require "gql/union"

module GQL
  class Error < StandardError; end

  def self.enum(name, consts)
    gql = Enum.new(name, consts)
    yield gql if block_given?
    gql.build
  end

  def self.extend(klass, type)
    gql = Extend.new(klass, type)
    yield gql
    gql.build
  end

  def self.fragment(name, node)
    gql = Fragment.new(name, node)
    yield gql
    gql.build
  end

  def self.input(name)
    gql = Input.new(name)
    yield gql
    gql.build
  end

  def self.interface(name)
    gql = Interface.new(name)
    yield gql
    gql.build
  end

  def self.mutation
    gql = Mutation.new
    yield gql
    gql.build
  end

  def self.query
    gql = Query.new
    yield gql
    gql.build
  end

  def self.type(name)
    gql = Type.new(name)
    yield gql
    gql.build
  end

  def self.union(name, types)
    gql = Union.new(name, types)
    yield gql
    gql.build
  end
end
