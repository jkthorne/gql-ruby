require "gql/base"

class GQL::Mutation < GQL::Base
  def initialize
    super
    @io = "query { "
  end
end
