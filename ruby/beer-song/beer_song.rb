class BeerSong
  def verse(start, finish = start)
    require 'pry'; binding.pry
    if start >= finish || start == 0
      if start == 2
        "2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall."
        verse(start - 1, finish)
      elsif start == 1
        "1 bottle of beer on the wall, 1 bottle of beer. Take it down and pass it around, no more bottles of beer on the wall."
        verse(start - 1, finish)
      elsif start == 0
        "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."
      elsif start == finish
        "#{start} bottles of beer on the wall, #{start} bottles of beer. Take one down and pass it around, #{start - 1} bottles of beer on the wall."
      else
        "#{start} bottles of beer on the wall, #{start} bottles of beer. Take one down and pass it around, #{start - 1} bottles of beer on the wall."
        verse(start - 1, finish)
      end
    end
  end
end
