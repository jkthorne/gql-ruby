require "gql"

puts(
  GQL.query do |gql|
    gql.transactions(input: :$input) do
      gql.dots
      gql.yolo
    end
  
    gql.no_block(foo: :$bar)
  
    gql.with_block(foo: :$bar) do
      gql.dots_yolo
    end
  end
)
