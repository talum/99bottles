class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, finish)
    start.downto(finish).map{|num| verse(num)}.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)
    next_bottle_number = BottleNumber.new(bottle_number.subsequent)

    <<-VERSE
#{bottle_number.count.to_s.capitalize} #{bottle_number.container} of beer on the wall, #{bottle_number.count} #{bottle_number.container} of beer.
#{bottle_number.action}, #{bottle_number.subsequent} #{next_bottle_number.container} of beer on the wall.
VERSE
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
