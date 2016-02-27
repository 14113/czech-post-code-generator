# Czech post CodeGenerator

[![Build Status](https://travis-ci.org/14113/czech-post-code-generator.svg?branch=master)](https://travis-ci.org/14113/czech-post-code-generator)

## Installation

Add this line to your application's Gemfile:

```Ruby
gem 'czech-post-code-generator'
```

And then execute:

```Ruby
$ bundle
```

Or install it yourself as:
    
```Ruby
$ gem install czech-post-code-generator
```

## Usage

```Ruby
service_id = 'DR'
order_id = 202
client_id = 7038
client_type = 'C'

serial_number = CzechPost::CodeGenerator::SerialNumber.new(service_id, order_id, client_id, client_type).run
```

### If you have just one place for sending, you can alternative use initializer

```Ruby
# config/initializers/czech_post_code_generator.rb
CzechPost::CodeGenerator.configure do |config|
  config.client_id = 7039
  config.client_type = 'D'
end
```

```Ruby
service_id = 'DR'
order_id = 202
serial_number = CzechPost::CodeGenerator::SerialNumber.new(service_id, order_id).run
```

## Documentation

For more details check [documentation](https://www.ceskaposta.cz/documents/10180/282457/apost_Smluvni-podavatel_uziv_dok_v1-11.pdf) from Czech post.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/czech-post-code-generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

