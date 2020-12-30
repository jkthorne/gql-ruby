require "gql/base"

class GQL::Enum < GQL::Base
  def initialize(name, consts)
    super()
    @io = "enum #{name} { #{Array(consts).join(" ")}"
  end
end
