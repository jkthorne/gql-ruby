require "gql/base"

class GQL::Type < GQL::Base
  def initialize(name, implements = nil)
    super()
    @io = "type #{name} #{Array(implements).join(" & ")} { "
  end
end
