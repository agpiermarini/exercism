class Brackets

  def self.paired?(expression)
    string = clean_expression(expression)
    check_string(string)
  end

  private
    def self.check_string(string)
      stack = Array.new
      string.each do | bracket |
        if Bracket::OPEN_BRACKET[bracket]
          stack.push(bracket)
        elsif stack.last == Bracket::CLOSE_BRACKET[bracket]
          stack.pop
        else
          return false
        end
      end
      stack.empty?
    end

    def self.clean_expression(expression)
      expression.gsub(/[^\[\]\{\}\(\)]/,'').split('')
    end
end

module Bracket
  CLOSE_BRACKET = { "}" => "{", "]" => "[", ")" => "(" }
  OPEN_BRACKET  = { "[" => true, "{" => true, "(" => true }
end

module BookKeeping
  VERSION = 4
end
