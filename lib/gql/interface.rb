require "gql/base"

class GQL::Interface < GQL::Base
  def initialize(name, implements = nil)
    super()
    @io = "interface #{name} #{Array(implements).join(" & ")} { "
  end
end
