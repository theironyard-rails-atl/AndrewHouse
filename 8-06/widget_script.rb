require './widget.rb'

new = Widget.new(WIDGET_INFO)

puts "the max price is #{new.max_price[:price]} from #{new.max_price[:name]}}"

puts "\n"

puts "the min price is #{new.min_price[:price]} from #{new.min_price[:name]}}"

puts "\n"

puts "the total revenue is #{new.total_revenue.round(2)}"

puts "\n"

puts "the total profit is #{new.total_profit.round(2)}"

puts "\n"

puts "the ten best sellers are #{new.ten_best_sellers}"

puts "\n"

puts "the number sold by departments are #{new.sold_by_department}"
