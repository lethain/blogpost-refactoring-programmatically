# using ruby_parser from https://github.com/seattlerb/ruby_parser
# also ruby2ruby for convert sexps to ruby code: sudo gem install ruby2ruby
require 'ruby_parser'
require 'ruby2ruby'

def load
  txt = ''
  while line = gets
    txt += line
  end
  txt
end


#puts load
puts ARGF.read
