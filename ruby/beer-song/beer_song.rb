class BeerSong
  def verse(start)
    if start == 2
<<-TEXT
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
TEXT
    elsif start == 1
<<-TEXT
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
TEXT
    elsif start == 0
<<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
TEXT
    else
<<-TEXT
#{start} bottles of beer on the wall, #{start} bottles of beer.
Take one down and pass it around, #{start - 1} bottles of beer on the wall.
TEXT
    end
  end

  def verses(start, finish = start, song = "")
    return song[0..-2] if start < finish
      if start == 2
song += <<-TEXT
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

TEXT
      elsif start == 1
song += <<-TEXT
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

TEXT
      elsif start == 0
song += <<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.

TEXT
      else
song += <<-TEXT
#{start} bottles of beer on the wall, #{start} bottles of beer.
Take one down and pass it around, #{start - 1} bottles of beer on the wall.

TEXT
    end
    verses(start-1, finish, song)
  end
end
