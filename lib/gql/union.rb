require "gql/base"

class GQL::Union < GQL::Base
  def initialize(name, types = nil)
    super()
    @io = "union #{name} = #{Array(types).join(" | ")}"
  end

  def build
    return io if built

    @built = true

    io
  end
end
