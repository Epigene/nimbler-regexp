require "bundler/setup"
require "nimbler_regexp"
require "pry"
require 'benchmark'

# #match?
n = 1_000
regexp = %r'\AHttps?://(?:.*)/(?:.*)\z'mixo
string_regex = "ath1"
string = "https://test.com/path1/path2?utm_campaign=true&test=true#anchor"

Benchmark.bmbm do |x|
  x.report("Regexp.match?") { n.times { regexp.match?(string) } }
  x.report("NimblerRegexp#is_regexp_match") { n.times { NimblerRegexp.is_regexp_match(string, regexp.inspect) } }
end; puts

Benchmark.bmbm do |x|
  x.report("String.match?(regexp)") { n.times { string.match?(regexp) } }
  x.report("NimblerRegexp#is_regexp_match") { n.times { NimblerRegexp.is_regexp_match(string, regexp.inspect) } }
end; puts

Benchmark.bmbm do |x|
  x.report("String.match?(string)") { n.times { string.match?(string_regex) } }
  x.report("NimblerRegexp#is_regexp_match") { n.times { NimblerRegexp.is_regexp_match(string, string_regex) } }
end; puts
