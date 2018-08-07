class Bob
  def self.hey(remark)
    remark = remark.strip.chomp

    if yelling?(remark)
      return "Calm down, I know what I'm doing!" if remark[-1] == "?"
      "Whoa, chill out!"
    elsif remark[-1] == "?"
      "Sure."
    elsif remark == ""
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  private
    def self.yelling?(remark)
      remark == remark.upcase && remark != remark.downcase
    end
end


module BookKeeping
  VERSION = 2
end
