require "./railroad"

describe Railroad do
  before do
    @railroad = Railroad.new "test_data.txt"
  end

  it "calculates the travel distance in a given itinerary" do
    @railroad.calc_dist("A-B-C".split("-")).should == 9
    @railroad.calc_dist("A-D".split("-")).should == 5
    @railroad.calc_dist("A-D-C".split("-")).should == 13
    @railroad.calc_dist("A-E-B-C-D".split("-")).should == 22
    @railroad.calc_dist("A-E-D".split("-")).should == "NO SUCH ROUTE"
  end

  it "finds all possible route with a maximum number of stops specified" do
    @railroad.available_route_max_stops_count("C", "C", 3).should === 2
  end

  it "finds all possible route with an exact number of stops specified" do
    @railroad.available_route_num_stops("A", "C", 4).should === 3
  end

  it "finds the shortest route from specified origin to destination" do
    @railroad.shortest_route("A", "C").should == 9
    @railroad.shortest_route("B", "B").should == 9
  end

  it "finds all possible routes with travel distance less than the specified number" do
    @railroad.available_route_max_distance("C", "C", 30).should == ["C-D-C", "C-E-B-C", "C-E-B-C-D-C", "C-D-C-E-B-C", "C-D-E-B-C", "C-E-B-C-E-B-C", "C-E-B-C-E-B-C-E-B-C"].uniq.length
  end
end