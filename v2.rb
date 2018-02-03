require 'ruby_parser'
require 'ruby2ruby'

def rewrite(expr)
  if expr.is_a? Sexp
    if expr[0] == :call &&
       expr[2] == :incr &&
       expr.size == 5 &&
       expr[4][0] == :lit &&
       expr[4][1] == 1

      # remove the second parameter
      expr.pop()
    end

    # descend into children
    expr.each { |x| rewrite(x) }
  end
  expr
end

parsed =  RubyParser.new.parse(ARGF.read)
rewritten = Ruby2Ruby.new.process rewrite(parsed)
puts rewritten
