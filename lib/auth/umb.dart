import 'package:flutter/material.dart';
import 'flight_api_service.dart'; // A custom service class

class NepalFlightBookingScreen extends StatefulWidget {
  const NepalFlightBookingScreen({super.key});

  @override
  State<NepalFlightBookingScreen> createState() => _NepalFlightBookingScreenState();
}

class _NepalFlightBookingScreenState extends State<NepalFlightBookingScreen> {
  // State variables for search form
  String? _departureCity;
  String? _arrivalCity;
  DateTime? _selectedDate;
  
  // Example list of domestic destinations in Nepal
  final List<String> _cities = ['Kathmandu', 'Pokhara', 'Biratnagar', 'Nepalgunj', 'Lukla'];

  // Data storage for search results
  Future<List<Flight>>? _flightsFuture;

  // Function to simulate a search (will call API in a real app)
  void _searchFlights() {
    if (_departureCity != null && _arrivalCity != null && _selectedDate != null) {
      setState(() {
        // In a real app, this would call your custom API service.
        _flightsFuture = FlightApiService().fetchFlights(
          departure: _departureCity!,
          arrival: _arrivalCity!,
          date: _selectedDate!,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nepal Flight Booking')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // --- Search Form (Dropdowns and DatePicker) ---
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Departure City'),
              value: _departureCity,
              items: _cities.map((city) => DropdownMenuItem(value: city, child: Text(city))).toList(),
              onChanged: (value) => setState(() => _departureCity = value),
            ),
            // ... (Add another DropdownButtonFormField for Arrival City)
            
            // --- Date Picker Button ---
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  setState(() => _selectedDate = date);
                }
              },
              child: Text(_selectedDate == null 
                  ? 'Select Date' 
                  : 'Date: ${_selectedDate!.toIso8601String().substring(0, 10)}'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchFlights,
              child: const Text('Search Flights'),
            ),
            const SizedBox(height: 30),
            
            // --- Flight Results ---
            if (_flightsFuture != null)
              FutureBuilder<List<Flight>>(
                future: _flightsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final flight = snapshot.data![index];
                        // Use a Card or ListTile to display flight details
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.flight_takeoff),
                            title: Text('${flight.airline} - ${flight.flightNumber}'),
                            subtitle: Text('${flight.departureTime} - ${flight.price} NPR'),
                            onTap: () {
                              // Navigator.push for the booking/payment screen
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text('No flights found.');
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

// Simple Model Class (in flight_model.dart)
class Flight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final double price;

  Flight({required this.airline, required this.flightNumber, required this.departureTime, required this.price});
}

// Placeholder API Service (in flight_api_service.dart)
class FlightApiService {
  Future<List<Flight>> fetchFlights({required String departure, required String arrival, required DateTime date}) async {
    // *** The most CRITICAL part for a Nepal app: Integrate with a local aggregator or global GDS. ***
    
    // 1. **Identify the API:** For domestic Nepal flights (Buddha Air, Yeti Airlines, Shree Airlines, etc.), 
    //    you typically need to integrate with a local flight aggregator/GDS provider in Nepal (e.g., Tourism Core)
    //    or a global GDS/platform that covers these carriers (e.g., Duffel, Amadeus).
    
    // 2. **Make HTTP Request:** Use the 'http' or 'dio' package.
    // final response = await http.post(
    //   Uri.parse('YOUR_NEPAL_API_ENDPOINT'),
    //   headers: {'Authorization': 'Bearer YOUR_API_KEY'},
    //   body: {'departure': departure, 'arrival': arrival, 'date': date.toIso8601String()},
    // );
    
    // Simulated dummy data for this example
    await Future.delayed(const Duration(seconds: 2));
    if (departure != arrival) {
      return [
        Flight(airline: 'Buddha Air', flightNumber: 'U4-201', departureTime: '07:30', price: 4500.0),
        Flight(airline: 'Yeti Airlines', flightNumber: 'YT-405', departureTime: '08:45', price: 4700.0),
      ];
    }
    return [];
  }
}