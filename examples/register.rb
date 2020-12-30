require "gql"

GQL.register(:foo) do |gql|
  gql.foo do
    gql.bar
  end
end

puts(
  GQL.query do |gql|
    gql.foo!
  end
)
