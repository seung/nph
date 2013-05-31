class Railroad
  def initialize(input_file)
    @towns = {}

    f = File.open(input_file)
    str = f.read
    data = str.split ", "
    data.each {|s| self.add_stop s }
  end

  def add_stop str
    origin = str[0].capitalize
    dest = str[1].capitalize
    dist = str[2..-1].to_i

    # Check the input for city, desk, and distance
    if dist.class != Fixnum || 
      (origin.unpack('C')[0] < 65) || (origin.unpack('C')[0] > 90) ||
      (dest.unpack('C')[0] < 65) || (dest.unpack('C')[0] > 90)
        raise "Invalid input"
    end
    
    if @towns.keys.include?(origin)
      # Skip if origin-dest already exists
      if @towns[origin].keys.include?(dest)
        raise "Known stop!"
      else
        # Add non-existing stop to the list
        @towns[origin][dest]=dist
      end
    else
      # Add new origin to the list
      @towns[origin] = {dest => dist}
    end
  end

  # Takes an array of stops and calculates the total travel distance
  def calc_dist stops
    dist = 0
    origin = stops.shift
    stops.each do |i|
      if @towns.include?(i) == false
        raise "Stops include an invalid stop"
      end
    end

    while stops.length >= 1
      dest = stops.shift
      if @towns[origin].keys.include?(dest)
        dist += @towns[origin][dest].to_i
        origin = dest
      else
        return "NO SUCH ROUTE"
      end
    end
    dist
  end

  def print
    @towns.each {|k, v| puts "#{k} : #{v}"}
  end

  def helper origin, dest, count, routestr
    r = []
    @towns[origin].each do |k, v|

      if count > 0
        helper k, dest, count - 1, routestr + k
      else
        if @res.include?(routestr) == false
          @res.push(routestr)
        end
      end

    end
    return routestr
  end 

  # Returns all possible routes given a maximum number of stops
  def available_route_max_stops origin, dest, stops
    @res = []
    result = []
    for l in 1..stops - 1
      @towns[origin].each do |k, v|
        @res.push(helper(k, dest, l, origin+k))
      end
    end

    @res.each do |i|
      if i[i.length - 1] == dest
        result.push(i.split(//).join("-"))
      end
    end
    result
  end

    # Returns all possible routes given a maximum number of stops
  def available_route_max_stops_count origin, dest, stops
    available_route_max_stops(origin, dest, stops).length
  end
 
  # Returns all possible routes for given number of stops
  def available_route_num_stops origin, dest, stops
    @res = []
    @towns[origin].each do |k, v|
      @res.push(helper(k, dest, stops - 1, origin+k))
    end

    result = []
    @res.each do |route|
      if (route[route.length - 1] == dest) && (route.length == stops + 1)
        result.push(route.split(//).join("-"))
      end
    end
    return result.length
  end

  # Returns the shortest route to given destination
  def shortest_route origin, dest
    @res = []
    @distance = []
    @result
    stops = 10

    for l in 1..stops - 1
      @towns[origin].each do |k, v|
        @res.push(helper(k, dest, l, origin+k))
      end
    end

    min = 1000;
    @res.each do |i| 
      if (i[i.length - 1] == dest) && (calc_dist(i.split(//)) < min )
        min = calc_dist(i.split(//))
        @result = i
      end
    end
    return min
  end

  # All possible routes with travel distance less than given max distance
  def available_route_max_distance origin, dest, dist
    if dist.class != Fixnum 
      raise "Invalid input"
    end
    res2 = []
    @result = []
    stops = 15

    for l in 0..stops - 1
      @towns[origin].each do |k, v|
        answer = available_route_max_stops(k, dest, l-1)
        answer.each do |i|
          i.prepend(origin + "-")
          rarray = i.split("-")
          
          if ((rarray.length > 2) && (calc_dist(rarray.clone) < 30))
            res2.push(rarray)
          end

        end
      end
    end
    res2.map{ |a| a.join '-' }.uniq.length
  end

end
