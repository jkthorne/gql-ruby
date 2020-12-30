# GQL

This is a DSL for writting GraphQL syntax.

## Installation

I have not posted to Rubygems yet.  This is still in alpha and is currently being used to write a few small clients.  If you want to use this you will have to install via git.

```ruby
gem 'gql', git: 'https://github.com/wontruefree/gql.git'
```

And then execute:

    $ bundle install

## Usage
### This examples will use the GraphQL starwars dataset.

Most of the Types in GraphQL can be accessed under the default `GQL` namespace.  For a basic query you can use the `query` method.

Here is an example of a query for heros.
```ruby
GQL.query do |q|
  q.hero do
    q.name
    q.height
    q.mass
  end
end
```

Here is an example of creating a type.
```ruby
GQL.type :Character do |t|
  t.name String
  t.friends [:Character]
  t.homeWorld :Planet
  t.species :Species
end
```

Here is a mutation.
```ruby
GQL.mutation do |m|
  m.CreateReviewForEpisode("$ep" => "Episode!", "$review" => "ReviewInput!") do
    m.createReview(episode: :$ep, review: :$review) do
      m.stars
      m.commentary
    end
  end
end
```

Creating an inline fragment.
```ruby
GQL.query do |q|
  q.HeroForEpisode("$ep" => "Episode!") do
    q.hero("episode" => "$ep") do
      q.name
      q.on_Droid do
        q.primaryFunction
      end
      q.on_Human do
        q.height
      end
    end
  end
end
```

Metafields
```ruby
GQL.query do |q|
  q.search(text: "an") do
    q.__typename
    q.on_Human do
      q.name
    end
    q.on_Droid do
      q.name
    end
    q.on_Starship do
      q.name
    end
  end
end
```

### Advanced Features

You can register a macro to be applied to your queiries.  This will expand inplace when called with a `!`

Here is what a macro looks like.
```ruby
GQL.register(:hero) do |gql|
  gql.hero do
    gql.name
    gql.height
    gql.mass
  end
end
```

And here is what it looks like to call in a query.
```ruby
GQL.query do |gql|
  gql.hero!
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
