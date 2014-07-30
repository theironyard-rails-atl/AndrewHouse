def hypotenuse side1, side2
  Math.sqrt(side1**2 + side2**2).to_f
end

# Mostly, symbols have that don't allow much change. Symbols are meant to be
# constant and have little to no variation.

# While strings have the flexibility to be manipulated and changed at will.

# Strings have many destructive menthods such as delete, gsub, and split
# (to name a few)

# While Symbols have very few methods that Strings don't have. A few include
# to_proc, id2name, and pretty_print_cycle.

# Numbers are already defined. They are constant and do not need to be redefined.

1.odd?
"Hi, my name is Andrew".split
:test.inspect
[1, 2, 3, 4].map(&:to_s)
{a: "hello", b: "there"}.keys

class Musher
  def initialize space
    @space = space
  end

  def mush to_be_mushed
    if to_be_mushed.is_a?(Array)
      to_be_mushed.join(" #{@space} ")
    elsif to_be_mushed.is_a?(String)
      to_be_mushed.split.join(" #{@space} ")
    else
      to_be_mushed.to_s.split("").join(" #{@space} ")
    end
  end
end

class Avenger
  def initialize *nums
    @nums = nums.to_a
  end

  def average
    @nums.inject(:+)/@nums.length.to_f
  end
end

def random_file_line file
  file_contents = []
  File.open(file).each { |line| file_contents << line.chomp }
  file_contents.sample
end
