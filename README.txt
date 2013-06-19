1. Instructions to run

1.1. To run the main program: 
ruby railroad_runner.rb test_data.txt

1.1.1. Verification of the solution
Result of running railroad_runnber.rb with the provided test input (stored in test_data.txt) matches the expected output.

1.2. Instructions to run the tests

1.2.1. To run the test for railroad.rb:
rspec railroad_spec.rb

1.2.2. To run the tests for route.rb:
rspec route_spec.rb


2. Overview of the design

A Railroad class represents a system map of a railroad system. A Route class represents an itinerary of a trip and has methods to analyze the route. By separating the Railroad class and the Route class, Route class and its method can be applied to multiple instances of Railroad classes.

2.1 Description of Railroad class

- A Railroad class represents a map of available origin-destination in a city or a system entity. @stations instance variable represents a mapping of all the stations and available routes (origin-destination). 
- The keys in @stations instance variable represent stations in the railroad system.
- The values in @stations instance variable represent available route from the specified origin and distance of the travel as a key-value pair.

2.2 Description of Route class

A Route class represents the itinerary of a trip and has methods to analyze the itinerary/trip.

2.2.1. Description of the instance variables of the Route class

- @origin represents the initial point of an itinerary/trip.
- @destination represents the final destination of an itinerary/trip.
- @stops represents a sequence of stops composed by an itinerary/trip.
- @railroad represents the system in which the route belongs to.

2.2.2. Description of the methods

- calc_dist method takes in an array of stops and returns the total distance (the sum of trip distance for every stop).
- helper method is a helper function for traversing.
- routes_max_stops method takes in the maximum number of stops and returns all available routes within the specified maximum number of stops.
- routecnt_max_stops method returns the count of the result of routes_max_stops method.
- routecnt_stops method returns the number of all routes with the specified number of stops from the origin to the destination.
- shortest_route method returns the shortest route to specified destination from the specified origin.
- routes_shorter_than method returns takes in the maximum distance specified and returns all available routes with travel distance less than specified maximum travel distance.
