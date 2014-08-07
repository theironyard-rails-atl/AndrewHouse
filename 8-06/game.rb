class Boxer
  attr_reader :speed, :power, :name
  attr_accessor :durability
  def initialize talents={}
    @speed = talents[:speed] || 5
    @power = talents[:power] || 5
    @durability = talents[:durability] || 20
    @name = talents[:name] || "Joe Schmo"
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
    super ({speed:3, power:8, name: 'Mike Tyson'}).merge talents
  end

  def uppercut boxer
    @power += 8
    punch boxer
    @power -= 8
    boxer.punch(self)
  end
end

class SpeedBoxer < Boxer
  def initialize talents={}
    super ({speed: 8, power: 3, name: 'Speedy'}).merge talents
  end

  def flurry boxer
    @speed += 8
    punch boxer
    @speed -= 8
    boxer.punch(self)
  end
end

class DurableBoxer < Boxer
  def initialize talents={}
    super ({durability: 40, speed:3, power:3, name: 'Hard Shell'}).merge talents
  end

  def turtle boxer
    @speed -= 1
    @durability += 3
    boxer.punch self
    punch boxer
    @speed += 1
  end
end

class Megatron < Boxer
  def initialize talents={}
    super ({power: 100, speed: 100, name: 'Megatron'}).merge talents
  end

  def ultimate_combo boxer
    100.times { punch boxer }
  end
end
