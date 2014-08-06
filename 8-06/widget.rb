require 'yaml'
WIDGET_INFO = YAML.load_file('widgets.yml')

class Widget
  include Enumerable

  attr_reader :widgets

  def initialize widgets
    @widgets = widgets
  end

  def each
    @widgets.each do |widget_hash|
      widget_hash.each do |widget|
        yield widget
      end
    end
  end

  def max_price
    @widgets.max_by do |widget|
      widget[:price]
    end
  end

  def min_price
    @widgets.min_by do |widget|
      widget[:price]
    end
  end

  def total_revenue
    @widgets.inject(0) { |sum, widget| sum += (widget[:price]*widget[:sold])}
  end

  def total_cost
    costs = @widgets.inject(0) { |sum, widget| sum += (widget[:sold] * widget[:cost_to_make])}
  end

  def total_profit
    total_revenue - total_cost
  end

  def ten_best_sellers
    @widgets.sort_by { |widget| widget[:sold]}.last(10).reverse
  end

  def sold_by_department
    @widgets.inject(Hash.new(0)) do |hash, widget|
      hash[widget[:department]] += widget[:sold]
      hash
    end
  end
end
