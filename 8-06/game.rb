class Boxer
  attr_reader :speed, :power
  attr_accessor :durability
  def initialize talents={}
    @speed = talents[:speed] || 5
    @power = talents[:power] || 5
    @durability = talents[:durability] || 20
  end

  def knockout?
    @durability <= 0
  end

  def damage
    rand(1..@power) + rand(1..@speed)
  end

  def punch boxer
    boxer.durability -= self.damage
  end

end

class PowerBoxer < Boxer
  def initialize talents={}
    super
    @speed = talents[:speed] || 3
    @power = talents[:power] || 8
  end

  def uppercut boxer
    @power += @power
    punch boxer
    @power -= @power
    boxer.punch(self)
  end
end

class SpeedBoxer < Boxer
  def initialize talents={}
    super
  end

  def flurry boxer
    @speed += @speed
    punch boxer
    @speed -= @speed
    boxer.punch(self)
  end
end

class Megatron < Boxer
  def initialize talents={}
    @power = 100
    @speed = 1
    super
  end

  def ultimate_combo boxer
    100.times { punch boxer }
  end
end
