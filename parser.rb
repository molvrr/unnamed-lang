# frozen_string_literal: true

require_relative 'lexer'

Var = Struct.new(:palavra, :expr)
Int = Struct.new(:valor)

class InvalidCode < StandardError; end

# Parser main class
class Parser
  attr_accessor :code, :ast, :tokens

  def initialize(code)
    @code = code
    @ast = []
    @tokens = Lexer.new(code).run
  end

  def run
    until tokens.empty?
      token = tokens.shift
      case token
      in ['valorzinho', _]
        case [tokens.shift, tokens.shift, tokens.shift]
        in [[:PALAVRA, x], ['=', _], [:INTEIRO, y]]
          ast.push(Var.new(x, y))
        else
          raise InvalidCode, 'Ih! Fiz essa parte ainda não :('
        end
      in [:INTEIRO, x]
        ast.push(Int.new(x))
      in [nil, nil]
      else
        raise 'Ih! Fiz essa parte ainda não :('
      end
    end
  end
end
