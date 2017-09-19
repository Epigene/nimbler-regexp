# nimbler-regexp

[![Gem Version](https://img.shields.io/github/tag/Epigene/nimbler-regexp.svg)](https://github.com/Epigene/nimbler-regexp/tags)
[![Build Status](https://travis-ci.org/Epigene/nimbler-regexp.svg?branch=master)](https://travis-ci.org/Epigene/nimbler-regexp)

Ruby Regexp monkeypatches in Nim for greater performance

This gem replaces most-used Regexpe class ruby methods with much faster counterparts written in Nim.  
Use for hassle-free, dependency-free speed gains, primarily in Rails projects.  

## Supported Platforms
As of version 0.9.0 the gem supports 64bit versions of Linux and Mac.  
Support for Windows is a hassle due to differing path separator, among other things.  
Open an issue or PR if other OS support is needed.  

## Dependencies

```ruby
ruby ">= 2.4.1", "< 2.5"
```

## Installation

```ruby
gem 'nimbler_regexp', require: false
```

```ruby
# in an initializer like /config/initializers/nimbler_regexp.rb
require 'nimbler_regexp'
require 'nimbler_regexp/monkeypatch'

NimblerRegexp.apply_monkeypatch!(verbose: true)
```

## Discussion
The tricky thing about Ruby regex matches is that they change the pseudo-global backreference variables `$<n>` and `$~`.  
This gem aims to not interfere with that, so an obvious low-hanging fruit is the `#match?` method.  

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Epigene/nimbler-regexp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

__Development setup__

1. Clone the project with `git clone git@github.com:Epigene/nimbler-regexp.git`
2. Make sure you are using Ruby v2.4.1+
2. Bundle
3. Run naive gem-code tests with `ruby test/nimbler_path_test.rb`
5. Work on feature, commit and make a pull request :clap:
6. See how benchmarks add up with `ruby test/nimbler_regexp_benchmarks.rb`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
