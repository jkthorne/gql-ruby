require "gql/base"

class GQL::Query < GQL::Base
  def initialize
    super
    @io = "query { "
  end
end
