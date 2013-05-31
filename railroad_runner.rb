require "./railroad"

@railroad = Railroad.new ARGV[0]
puts "Output #1: #{@railroad.calc_dist("A-B-C".split("-"))}"
puts "Output #1: #{@railroad.calc_dist("A-D".split("-"))}"
puts "Output #1: #{@railroad.calc_dist("A-D-C".split("-"))}"
puts "Output #1: #{@railroad.calc_dist("A-E-B-C-D".split("-"))}"
puts "Output #1: #{@railroad.calc_dist("A-E-D".split("-"))}"
puts "Output #1: #{@railroad.available_route_max_stops_count("C", "C", 3)}"
puts "Output #1: #{@railroad.available_route_num_stops("A", "C", 4)}"
puts "Output #1: #{@railroad.shortest_route("A", "C")}"
puts "Output #1: #{@railroad.shortest_route("B", "B")}"
puts "Output #1: #{@railroad.available_route_max_distance("C", "C", 30)}"