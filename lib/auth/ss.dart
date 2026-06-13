class SeatSelectionScreen extends StatefulWidget {
  final String busName;
  SeatSelectionScreen({required this.busName});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  // Track selected seats (Index-based)
  Set<int> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Seats - ${widget.busName}")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _statusIndicator(Colors.grey, "Available"),
                _statusIndicator(Colors.blue, "Selected"),
                _statusIndicator(Colors.redAccent, "Booked"),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 2 seats - aisle - 2 seats
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 32,
              itemBuilder: (context, index) {
                // Create an aisle in the middle (index 2, 6, 10...)
                if (index % 4 == 2) return SizedBox.shrink();

                bool isSelected = selectedSeats.contains(index);
                bool isBooked = index == 5 || index == 12; // Dummy booked data

                return GestureDetector(
                  onTap: isBooked ? null : () {
                    setState(() {
                      if (isSelected) selectedSeats.remove(index);
                      else selectedSeats.add(index);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isBooked ? Colors.redAccent : (isSelected ? Colors.blue : Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("${index + 1}", style: TextStyle(color: Colors.white))),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blueAccent),
            onPressed: selectedSeats.isEmpty ? null : () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Seats ${selectedSeats.join(', ')} confirmed!")));
            },
            child: Text("Confirm Booking", style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _statusIndicator(Color color, String label) {
    return Row(
      children: [
        Container(width: 15, height: 15, color: color),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}