# using ruby_parser from https://github.com/seattlerb/ruby_parser
# also ruby2ruby for convert sexps to ruby code: sudo gem install ruby2ruby
require 'ruby_parser'
require 'ruby2ruby'

def rewrite(expr)
  expr
end

parsed =  RubyParser.new.parse(ARGF.read)
rewritten = Ruby2Ruby.new.process rewrite(parsed)
puts rewritten
