# Route represents a sequence of origin-destination subroutes
class Route
  def initialize(railroad, itinerary)
    @origin = itinerary[0]
    @destination = itinerary[-1]
    @stops = itinerary.split "-"
    @railroad = railroad
  end

  # tripArr: an array of stops
  # calculates the total travel distance
  def calc_dist(*tripArr)

    if (tripArr[0])
      tripArr = tripArr[0].is_a?(Array) ? tripArr[0] : tripArr[0].split(//)
    else
      tripArr = @stops
    end

    # set the first element as origin
    from = tripArr.shift
    tripArr.each do |i|
      raise "Itinerary includes an unavailable route" if @railroad.stations.keys.include?(i) == false
    end

    # iterate through every route in the given trip
    dist = 0
    while tripArr.length >= 1
      dest = tripArr.shift
      if @railroad.stations[from].keys.include?(dest)
        dist += @railroad.stations[from][dest].to_i
        from = dest
      else
        return "NO SUCH ROUTE"
      end
    end
    dist
  end

  # helper function for traversing
  def helper origin, dest, count, routestr
    r = []
    @railroad.stations[origin].each do |k, v|

      if count > 0
        helper k, dest, count - 1, routestr + k
      else
        @res.push(routestr) unless @res.include?(routestr)
      end

    end
    routestr
  end 

  # stops: maximum number of stops
  # returns all available routes within the maximum number of stops
  def routes_max_stops stops, *origDest
    @res = []
    result = []

    # adds all possible route of l stops
    for l in 1...stops
      @railroad.stations[@origin].each do |k, v|
        @res.push(helper(k, @destination, l, @origin+k))
      end
    end

    @res.each do |i|
      result.push(i.split(//).join("-")) if i[i.length - 1] == @destination
    end

    result
  end

  # stops: maximum number of stops
  # calls routes_max_stops and returns the length of the result
  def routecnt_max_stops stops, *origDest
    routes_max_stops(stops, origDest).length
  end

  # returns the number of all routes with the specified number of stops
  def routecnt_stops stops
    @res = []
    @railroad.stations[@origin].each do |k, v|
      @res.push(helper(k, @destination, stops - 1, @origin+k))
    end

    result = []
    @res.each do |route|
      if (route[route.length - 1] == @destination) && (route.length == stops + 1)
        result.push(route.split(//).join("-"))
      end
    end
    return result.length
  end

  # returns the shortest route to given destination
  def shortest_route
    @res = []
    @distance = []
    @result
    stops = 10

    # create a list of all available routes
    for l in 1..stops - 1
      @railroad.stations[@origin].each do |k, v|
        @res.push(helper(k, @destination, l, @origin+k))
      end
    end

    # select the route with the minimum distance of travel
    min = 1000;
    @res.each do |i|
      calculated_dist = calc_dist(i)
      if (i[i.length - 1] == @destination) && (calculated_dist.is_a? Fixnum) && ((calculated_dist) < min)
        min = calculated_dist
        @result = i
      end
    end
    return min
  end

  # dist: maximum distance
  # all available routes with travel distance less than given max distance
  def routes_shorter_than dist
    raise "Invalid input" if dist.class != Fixnum
    res2 = []
    @result = []
    stops = 15

    for l in 0..stops - 1
      @railroad.stations[@origin].each do |k, v|
        answer = routes_max_stops(l-1, k, @destination)
        answer.each do |i|
          rarray = i.split("-")
          res2.push(rarray) if rarray.length > 2 && calc_dist(rarray.clone) < 30
        end
      end
    end
    res2.map{ |a| a.join '-' }.uniq.length
  end

end
