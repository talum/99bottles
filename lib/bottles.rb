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
#{action(number)}, #{subsequent(number)} #{container(subsequent(number))} of beer on the wall.
VERSE
  end

  def count(number)
    BottleNumber.new(number).count
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def subsequent(number)
    BottleNumber.new(number).subsequent
  end

  def container(number)
    BottleNumber.new(number).container
  end

  def action(number)
    BottleNumber.new(number).action
  end

end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def count
    if number == 0
      "no more"
    else
      number
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def subsequent
    if number == 0
      "99"
    elsif number == 1
      "no more"
    else
      number - 1
    end
  end

  def container
    if number == 1
      "bottle"
    else
     "bottles"
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
   end
end
