require "./railroad"
require "./route"

@railroad = Railroad.new ARGV[0]
route = Route.new @railroad, "A-B-C"
puts "Output #1: #{route.calc_dist("A-B-C".split("-"))}"

route = Route.new @railroad, "A-D"
puts "Output #2: #{route.calc_dist("A-D".split("-"))}"

route = Route.new @railroad, "A-D-C"
puts "Output #3: #{route.calc_dist("A-D-C".split("-"))}"

route = Route.new @railroad, "A-E-B-C-D"
puts "Output #4: #{route.calc_dist("A-E-B-C-D".split("-"))}"

route = Route.new @railroad, "A-E-D"
puts "Output #5: #{route.calc_dist("A-E-D".split("-"))}"

route = Route.new @railroad, "C-C"
puts "Output #6: #{route.routecnt_max_stops(3)}"

route = Route.new @railroad, "A-C"
puts "Output #7: #{route.routecnt_stops(4)}"

route = Route.new @railroad, "A-C"
puts "Output #8: #{route.shortest_route()}"

route = Route.new @railroad, "B-B"
puts "Output #9: #{route.shortest_route()}"

route = Route.new @railroad, "C-C"
puts "Output #10: #{route.routes_shorter_than(30)}"
