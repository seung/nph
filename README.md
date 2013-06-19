A Railroad class represents a system map of a railroad system. A Route class represents an itinerary of a trip and has methods to analyze the route. By separating the Railroad class and the Route class, Route class and its method can be applied to multiple instances of Railroad classes.

Description of Railroad class

- A Railroad class represents a map of available origin-destination in a city or a system entity. @stations instance variable represents a mapping of all the stations and available routes (origin-destination). 
- The keys in @stations instance variable represent stations in the railroad system.
- The values in @stations instance variable represent available route from the specified origin and distance of the travel as a key-value pair.

Description of Route class

A Route class represents the itinerary of a trip and has methods to analyze the itinerary/trip.
