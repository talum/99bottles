class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    start.downto(finish).map{|num| verse(num)}.join("\n")
  end

  def verse(number)
    <<-VERSE
#{count(number).to_s.capitalize} #{container(number)} of beer on the wall, #{count(number)} #{container(number)} of beer.
#{action(number)}
VERSE
  end

  def count(number)
    if number == 0
      "no more"
    else
      number
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def subsequent(number)
    if number == 1
      "no more"
    else
      number - 1
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
     "bottles"
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{pronoun(number)} down and pass it around, #{subsequent(number)} #{container(subsequent(number))} of beer on the wall."
    end
  end
end
