class Brackets
  def self.paired?(expression)
    brackets = clean_expression(expression)
    require 'pry'; binding.pry
  end

  private
    def self.clean_expression(expression)
      expression.gsub(/[^\[\]\{\}\(\)]/,'')
    end
end
