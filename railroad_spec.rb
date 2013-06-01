require "./railroad"

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

end
