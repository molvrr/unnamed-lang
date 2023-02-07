require 'strscan'

SYMBOLS = %w[= + -].map { |x| Regexp.quote(x) }
KEYWORDS = %w[valorzinho puts].freeze

class InvalidToken < StandardError; end

class Lexer
  attr_reader :tokens, :str, :scanner

  def initialize(str)
    @tokens = []
    @str = str
    @scanner = StringScanner.new(str)
  end

  def run
    until scanner.empty?
      case
      when scanner.skip(/\s+/)
      when tok = scanner.scan(/(#{SYMBOLS.join('|')})/)
        tokens << [tok, nil]
      when tok = scanner.scan(/(#{KEYWORDS.join('|')})/)
        tokens << [tok, nil]
      when tok = scanner.scan(/(\d+)/)
        tokens << [:INTEIRO, tok.to_i]
      when tok = scanner.scan(/(\w+)/)
        tokens << [:PALAVRA, tok]
      when scanner.scan(/"/)
        tokens << [:SENTENCA, scanner.scan_until(/"/)[..-2]]
      else
        raise InvalidToken, "Erro na coluna #{scanner.pos}. Não consegui reconhecer este token: #{scanner.peek(5)}"
      end
    end

    tokens << [nil, nil]
  end
end
