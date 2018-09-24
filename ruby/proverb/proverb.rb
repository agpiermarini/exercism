class Proverb
  def Proverb.new(*args)
    proverb = [*args].map { |word| LINES[word] }
    qualifier = [*args].last.class == Hash ? "#{[*args].last[:qualifier]} " : nil
    proverb.push("And all for the want of a #{qualifier}#{[*args].first}.")
    proverb.compact.uniq.join('')
  end
end

LINES = {
  "shoe"     => "For want of a nail the shoe was lost.\n",
  "horse"    => "For want of a shoe the horse was lost.\n",
  "rider"    => "For want of a horse the rider was lost.\n",
  "value"    => "For want of a key the value was lost.\n",
  "message"  => "For want of a rider the message was lost.\n",
  "battle"   => "For want of a message the battle was lost.\n",
  "kingdom"  => "For want of a battle the kingdom was lost.\n"
}
