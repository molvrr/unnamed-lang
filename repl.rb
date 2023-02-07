# frozen_string_literal: true

require_relative 'parser'

D_ENV = {}

loop do
  print '=> '
  code = gets.chomp
  begin
    parser = Parser.new(code)
    parser.run
    until parser.ast.empty?
      tok = parser.ast.shift

      case tok
      in Var(palavra, expr)
        D_ENV[palavra] = expr
        p D_ENV
      end
    end
  # rescue InvalidToken => e
  #   puts e.message
  # rescue InvalidCode => e
  rescue => e
    puts e.message
  end
end
