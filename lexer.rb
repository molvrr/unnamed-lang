require 'strscan'

SYMBOLS = %w(= + -).map { |x| Regexp.quote(x) }
KEYWORDS = %w(let)

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
        tokens << [:INT, tok.to_i]
      when tok = scanner.scan(/(\w+)/)
        tokens << [:WORD, tok]
      when scanner.scan(/"/)
        tokens << [:STRING, scanner.scan_until(/"/)[..-2]]
      else
        raise "Can't recognize token #{scanner.peek(5)}"
      end
    end

    tokens << [nil, nil]
  end
end
