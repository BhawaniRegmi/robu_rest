import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          width: 350,
          height: 180,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              // Top Section: Flight/Event Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  columnText("NYC", "New York"),
                  const Icon(Icons.flight_takeoff, color: Colors.white),
                  columnText("LDN", "London"),
                ],
              ),
              const Spacer(),
              // Dotted Line
              Row(
                children: List.generate(
                  20,
                  (index) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 1,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Bottom Section: Time and Seat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  columnText("08:30 AM", "Date: 12 Oct"),
                  columnText("24B", "Seat"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget columnText(String top, String bottom) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(top, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(bottom, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}

// Custom Clipper for the "Ticket" side notches
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Right side notch
    path.addOval(Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: 15));
    // Left side notch
    path.addOval(Rect.fromCircle(center: Offset(0, size.height / 2), radius: 15));
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}