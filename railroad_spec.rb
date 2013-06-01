require "./railroad"
# require "test/unit"

describe Railroad do
  before do
    @railroad = Railroad.new "test_data.txt"
  end

  it "returns available destinations from specified origin" do
    @railroad.return_route("A").should == {"B"=>5, "D"=>5, "E"=>7}
    @railroad.return_route("B").should == {"C"=>4}
    @railroad.return_route("C").should == {"D"=>8, "E"=>2}
    @railroad.return_route("D").should == {"C"=>8, "E"=>6}
    @railroad.return_route("E").should == {"B"=>3}
  end

  # it "calculates the travel distance in a given itinerary" do
  #   @railroad.calc_dist("A-B-C".split("-")).should == 9
  #   @railroad.calc_dist("A-D".split("-")).should == 5
  #   @railroad.calc_dist("A-D-C".split("-")).should == 13
  #   @railroad.calc_dist("A-E-B-C-D".split("-")).should == 22
  #   @railroad.calc_dist("A-E-D".split("-")).should == "NO SUCH ROUTE"
  # end

  # it "finds all possible route with a maximum number of stops specified" do
  #   @railroad.routecnt_max_stops("C", "C", 3).should === 2
  # end

  # it "finds all possible route with an exact number of stops specified" do
  #   @railroad.routecnt_stops("A", "C", 4).should === 3
  # end

  # it "finds the shortest route from specified origin to destination" do
  #   @railroad.shortest_route("A", "C").should == 9
  #   @railroad.shortest_route("B", "B").should == 9
  # end

  # it "finds all possible routes with travel distance less than the specified number" do
  #   @railroad.routes_shorter("C", "C", 30).should == ["C-D-C", "C-E-B-C", "C-E-B-C-D-C", "C-D-C-E-B-C", "C-D-E-B-C", "C-E-B-C-E-B-C", "C-E-B-C-E-B-C-E-B-C"].uniq.length
  # end
end

# class TestRailroad < Test::Unit::TestCase
#   def setup
#     @railroad = Railroad.new "test_data.txt"
#   end

#   def test_available_destinations_from_specified_origin
#     # @railroad.return_route("A").should == {"B"=>5, "D"=>5, "E"=>7}
#     rr = @railroad.return_route("A")
#     assert_equal 5, rr["B"]
#     assert_equal 5, rr["D"]
#     assert_equal 7, rr["E"]
#     # assert_equal {"B"=>5, "D"=>5, "E"=>7}, rr
#   end
# end