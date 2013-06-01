# Railroad represents a map of available origin-destination in a city
class Railroad
  attr_accessor :stations
  def initialize(input_file)
    @stations = {}

    # parse every entry for route from file
    f = File.open(input_file)
    str = f.read
    data = str.split ", "
    data.each {|s| self.add_stop s }
  end

  # add available route to the system map
  def add_stop str
    origin = str[0].capitalize
    dest = str[1].capitalize
    dist = str[2..-1].to_i

    # check the input for city, dest, and distance
    if dist.class != Fixnum || 
      (origin.unpack('C')[0] < 65) || (origin.unpack('C')[0] > 90) ||
      (dest.unpack('C')[0] < 65) || (dest.unpack('C')[0] > 90)
        raise "Invalid input"
    end
    
    # check for duplicate entry
    if @stations.keys.include?(origin)
      # skip if origin-dest already exists
      if @stations[origin].keys.include?(dest)
        raise "Known stop!"
      else
        # add non-existing stop to the list
        @stations[origin][dest]=dist
      end
    else
      # add new origin to the list
      @stations[origin] = {dest => dist}
    end
  end

  # return all available routes from the origin
  def return_route origin
    @stations[origin]
  end

end
