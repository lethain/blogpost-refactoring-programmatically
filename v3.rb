require 'ruby_parser'
require 'ruby2ruby'

def rewrite(expr)
  if expr.is_a? Sexp
    if expr[0] == :for
      lst = expr[1]
      param = expr[2]
      func = expr[3]
      expr.clear
      expr[0] = :iter
      expr[1] = Sexp.new(:call, lst, :each)
      expr[2] = Sexp.new(:args, param[1])
      expr[3] = func
    end

    # descend into children
    expr.each { |x| rewrite(x) }
  end
  expr
end

parsed =  RubyParser.new.parse(ARGF.read)
rewritten = Ruby2Ruby.new.process rewrite(parsed)

# strip out extra, weird parenthesis
regex = /^(\s+)\((.*)\)\s*$/
rewritten = rewritten.split("\n").map do |line|
  if line =~ regex
    match = regex.match(line)    
    match[1] + match[2]
  else    
    line
  end
end

puts rewritten
