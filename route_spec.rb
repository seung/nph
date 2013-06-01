require "./route"
require "./railroad"

describe Route do
  before do
    @railroad = Railroad.new "test_data.txt"
  end

  it "calculates the travel distance in a given itinerary" do
    route = Route.new @railroad, "A-B-C"
    route.calc_dist().should == 9
    route = Route.new @railroad, "A-D"
    route.calc_dist().should == 5
    route = Route.new @railroad, "A-D-C"
    route.calc_dist().should == 13
    route = Route.new @railroad, "A-E-B-C-D"
    route.calc_dist().should == 22
    route = Route.new @railroad, "A-E-D"
    route.calc_dist().should == "NO SUCH ROUTE"
  end

  it "finds all possible route with a maximum number of stops specified" do
    route = Route.new @railroad, "C-C"
    route.routecnt_max_stops(3).should == 2
  end

  it "finds all possible route with an exact number of stops specified" do
    route = Route.new @railroad, "A-C"
    route.routecnt_stops(4).should === 3
  end

  it "finds the shortest route from specified origin to destination" do
    route = Route.new @railroad, "A-C"
    route.shortest_route().should == 9
    route = Route.new @railroad, "B-B"
    route.shortest_route().should == 9
  end

  it "finds all possible routes with travel distance less than the specified number" do
    route = Route.new @railroad, "C-C"
    route.routes_shorter(30).should == 7
  end
end
