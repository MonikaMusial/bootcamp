require_relative 'frame'
require 'byebug'

class Game
  def initialize
    @round = 0
    @counter = 0
    @frames = {}
    @scoring = 0
  end

  attr_accessor :round, :counter, :scoring, :frames

  def roll(pins)
    if @counter.zero? && pins != 10
      @counter = pins
    else
      @round += 1
      frame = Frame.new(@round)
      frame.values = pins == 10 ? [pins] : [@counter, pins]
      frame.check_ten
      @counter = 0
      @frames[@round] = frame
      frame
    end
  end

  def scoring
    round.zero? && (return @scoring)
    
    @frames.each do |key, value|
      value.frame_sum += frames[key + 1].values[0] if value.is_spare
      @scoring += value.frame_sum
    end
    @scoring
  end
end


